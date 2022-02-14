// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

// Sweetgreen's menu library
library SweetgreenMenu_Spring2022 {
    /***********
     * Structs *
     **********/
    struct Patron {
        Order[] orders;
        address address_;
        uint256 joined;
    }

    struct Order {
        WarmBowl[] wbs; // `WarmBowl` enum array
        Salad[] salads; // `Salad` enum array
        Featured[] feats; // `Featured` enum array
        CreateYourOwn[] cyos; // `CreateYourOwn` struct array
        Side[] sides; // `Side` enum array
        Beverage[] bevs; // // `Beverage` enum array
        DietaryRestriction[] drs; // `DietaryRestriction` enum array
    }

    struct CreateYourOwn {
        Base[] base;
        Topping[] toppings;
        Premium[] premiums;
        Dressing[] dressings;
    }

    enum Side {
        None,
        MisoRoastedVeggies, // seasonal
        RosemaryFocaccia
    }

    enum Beverage {
        None,
        HealthAde__PinkLadyApple,
        HealthAde__Pomegrante,
        JasmineGreenTea,
        HibiscusCloverTea,
        Spindrift__RaspberryLime,
        Spindrift__Grapefruit,
        StillWater,
        SparklingWater
    }

    /*********************
     * Main course stuff *
     ********************/
    enum WarmBowl {
        None,
        Featured,
        CreateYourOwn
    }

    enum Featured {
        None,
        AvocadoChickpeaCrunch,
        HotHoneyChicken,
        ValkryaesExtraCrispyCustom, // seasonal
        SteelheadRemoulade, // seasonal
        MisoBowl, // seasonal
        PotatoSaladSalad, // seasonal
        CrispyChickenSalad // seasonal
    }

    enum Salad {
        None,
        FarmhouseCaesar,
        GuacamoleGreens,
        KaleCaesar,
        BuffaloChickenBowl,
        SuperGreenGoddess,
        GardenCobb
    }

    /*****************************
     * enums for `CreateYourOwn` *
     ****************************/
    enum AddBreadToBowl {
        Yes,
        No
    }

    enum Base {
        None,
        ChoppedRomaine,
        Arugula,
        BabySpinach,
        SpringMix,
        ShreddedKale,
        WarmWildRice,
        WarmQuinoa
    }

    enum Topping {
        ChoppedPickles,
        Raisins,
        Apples,
        Basil,
        RawCarrots,
        Chickpeas,
        Cilantro,
        Cucumber,
        RawBeen,
        RedOnion,
        RoastedSweetPotato,
        ShreddedCabbage,
        SpicyBroccoli,
        Tomato,
        Lentils,
        SpicySunflowerSeeds,
        CrispyRice,
        ToastedAlmonds,
        TortillaChips,
        ZaatarBreadcrumbs
    }

    enum Premium {
        MisoRootVegetables,
        PickeledCarrotsCelery,
        BlueCheese,
        GoatCheese,
        ShavedParmesan,
        ParmesanCrisp,
        HardBoiledEgg,
        HotRoastedSweetPotatoes,
        Avocado,
        RoastedSesameTofu,
        WarmPortobelloMix,
        BlackenedChicken,
        RoastedChicken,
        Steelhead
    }

    enum Dressing {
        RemouladeDressing,
        GreenGoddessRanchDressing,
        BalsamicVinaigrette,
        BalsamicVinegar,
        CaesarDressing,
        ExtraVirginOliveOil,
        LimeCilantroJalapenoVinaigrette,
        MisoSesameGingerDressing,
        PestoVinaigrette,
        SpicyCashewDressing,
        Sweetgreen__HotSauce,
        FreshLimeSqueeze,
        FreshLemonSqueeze,
        RedChilli
    }

    enum DietaryRestriction {
        Diary,
        Meat,
        Nuts,
        Gluten,
        Fish,
        Soy
    }
}

// Sweetgreen's point-of-sale (PoS) contract
contract Sweetgreen {
    mapping(address => Patron[]) public orders;
    mapping(address => Patron) patrons;

    /**
     * @dev Arrays needed for a single `Order` struct.
     *
     *    - uint256[] warmBowls
     *    - uint256[] salads
     *    - CreateYourOwn[] createYourOwn
     *    - uint256[] sides
     *    - uint256[] beverages
     *    - uint256[] dietaryRestrictions
     */
    WarmBowl[] warmBowls;
    Salad[] salads; // `Salad` enum array
    CreateYourOwn[] createYourOwn; // `CreateYourOwn` struct array
    Side[] sides; // `Sides` enum array
    Beverage[] beverages; // // `Beverages` enum array
    DietaryRestriction[] dietaryRestrictions; // `DietaryRestrictions` enum

    DietaryRestriction[] uniqueDRs = [
        DietaryRestriction.Diary,
        DietaryRestriction.Fish,
        DietaryRestriction.Gluten,
        DietaryRestriction.Meat,
        DietaryRestriction.Nuts,
        DietaryRestriction.Soy
    ];

    /**
     * @dev Creates 1 order from user's selections on the UI.
     * @notice This function must ONLY be called if the `hasDuplicates()`
     *         function, which is defined on the frontend, returns `true`.
     * @return order_
     */
    function createOrder(
        address _patron,
        uint256 cost,
        WarmBowl[] memory _wbs,
        Featured[] memory _feats,
        Salad[] memory _salads,
        CreateYourOwn[] memory _cyos,
        Side[] memory _sides,
        Beverage[] memory _bevs,
        DietaryRestriction[] memory _drs
    ) public returns (Order memory order_) {
        require(
            _wbs.length < 5,
            "You tried adding more than the order limit for WarmBowls!"
        );
        require(
            _feats.length < 5,
            "You tried adding more than the order limit for Featured items!"
        );
        require(
            _salads.length < 5,
            "You tried adding more than order order limit for Salads!"
        );
        require(
            _cyos.length < 5,
            "You tried adding more than the order limit for CreateYourOwns!"
        );
        require(
            _sides.length < 5,
            "You tried adding more than the order limit for Sides!"
        );
        require(
            _bevs.length < 5,
            "You tried adding more than the order limit for Sides!"
        );
        require(
            _drs.length < 6,
            "You tried adding more than the order limit for DietaryRestrictions!"
        );

        // We push to `.orders` after setting the order items individually
        patrons[_patron].address_ = _patron;
        patrons[_patron].joined = block.timestamp;

        Order memory order;

        // Procedurally, create bowl to add to patron's list of `orders`
        if (uint256(_wbs[0]) != 0) order.wbs = _wbs; // 1
        if (uint256(_feats[0]) != 0) order.feats = _feats; // 2
        if (uint256(_salads[0]) != 0) order.salads = _salads; // 3
        if (_cyos.length > 0) order.cyos = _cyos; // 4
        if (uint256(_sides[0]) != 0) order.sides = _sides; // 5
        if (uint256(_bevs[0]) != 0) order.bevs = _bevs; // 6
        if (uint256(_drs[0]) != 0) order.drs = _drs; // 7

        // Add order to patron's order history
        patrons[_patron].orders.push(order);

        emit Order__Added(_patron, block.timestamp, cost, order);

        return order;
    }

    /**
     * todo In Javascript, check if `drs` array is subset of `uniqueDRs` array
     let s = new Set,
       m = uniqueDRs.length,
       n = drs.length

     for (let i = 0; i < m; i++) {
        s.add(uniqueDRs[i])
     }

     let p = s.size()

     for (let i = 0; i < n; i++) {
         s.add(drs[i])
     }

     if (s.size() == p) {
        return true
     } else {
        return false
     }
     */

    function totalCost(Order memory order) public returns (uint256) {
        uint256 cost;

        // @todo Get the cost of each sum of items that are added to the order
        // order.wbs.cost;
        // order.feats.cost;
        // order.salads.cost;
        // order.cyos.cost;
        // order.sides.cost;
        // order.drs.cost;

        return cost;
    }

    struct Patron {
        Order[] orders;
        address address_;
        uint256 joined;
    }

    struct Order {
        WarmBowl[] wbs; // `WarmBowl` enum array
        Salad[] salads; // `Salad` enum array
        Featured[] feats; // `Featured` enum array
        CreateYourOwn[] cyos; // `CreateYourOwn` struct array
        Side[] sides; // `Side` enum array
        Beverage[] bevs; // // `Beverage` enum array
        DietaryRestriction[] drs; // `DietaryRestriction` enum array
    }

    /**
     * @dev Emitted when an order is made.
     */
    event Order__Added(
        address indexed address_,
        uint256 indexed timestamp,
        uint256 cost,
        Order order
    );

    enum Side {
        None,
        MisoRoastedVeggies, // seasonal
        RosemaryFocaccia
    }

    enum Beverage {
        None,
        HealthAde__PinkLadyApple,
        HealthAde__Pomegrante,
        JasmineGreenTea,
        HibiscusCloverTea,
        Spindrift__RaspberryLime,
        Spindrift__Grapefruit,
        StillWater,
        SparklingWater
    }

    /*********************
     * Main course stuff *
     ********************/
    enum WarmBowl {
        None,
        Featured,
        CreateYourOwn
    }

    enum Featured {
        None,
        AvocadoChickpeaCrunch,
        HotHoneyChicken,
        ValkryaesExtraCrispyCustom, // seasonal
        SteelheadRemoulade, // seasonal
        MisoBowl, // seasonal
        PotatoSaladSalad, // seasonal
        CrispyChickenSalad // seasonal
    }

    struct CreateYourOwn {
        Base[] base;
        Topping[] toppings;
        Premium[] premiums;
        Dressing[] dressings;
    }

    enum Salad {
        None,
        FarmhouseCaesar,
        GuacamoleGreens,
        KaleCaesar,
        BuffaloChickenBowl,
        SuperGreenGoddess,
        GardenCobb
    }

    /*****************************
     * enums for `CreateYourOwn` *
     ****************************/
    enum AddBreadToBowl {
        Yes,
        No
    }

    enum Base {
        None,
        ChoppedRomaine,
        Arugula,
        BabySpinach,
        SpringMix,
        ShreddedKale,
        WarmWildRice,
        WarmQuinoa
    }

    enum Topping {
        None,
        ChoppedPickles,
        Raisins,
        Apples,
        Basil,
        RawCarrots,
        Chickpeas,
        Cilantro,
        Cucumber,
        RawBeen,
        RedOnion,
        RoastedSweetPotato,
        ShreddedCabbage,
        SpicyBroccoli,
        Tomato,
        Lentils,
        SpicySunflowerSeeds,
        CrispyRice,
        ToastedAlmonds,
        TortillaChips,
        ZaatarBreadcrumbs
    }

    enum Premium {
        None,
        MisoRootVegetables,
        PickeledCarrotsCelery,
        BlueCheese,
        GoatCheese,
        ShavedParmesan,
        ParmesanCrisp,
        HardBoiledEgg,
        HotRoastedSweetPotatoes,
        Avocado,
        RoastedSesameTofu,
        WarmPortobelloMix,
        BlackenedChicken,
        RoastedChicken,
        Steelhead
    }

    enum Dressing {
        None,
        RemouladeDressing,
        GreenGoddessRanchDressing,
        BalsamicVinaigrette,
        BalsamicVinegar,
        CaesarDressing,
        ExtraVirginOliveOil,
        LimeCilantroJalapenoVinaigrette,
        MisoSesameGingerDressing,
        PestoVinaigrette,
        SpicyCashewDressing,
        Sweetgreen__HotSauce,
        FreshLimeSqueeze,
        FreshLemonSqueeze,
        RedChilli
    }

    enum DietaryRestriction {
        None,
        Diary,
        Meat,
        Nuts,
        Gluten,
        Fish,
        Soy
    }
}
