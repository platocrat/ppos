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

    function createOrder(
        address _patron,
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
        // @todo Restrict duplicates on the UI as well!
        require(
            drsHasDuplicates(_drs) == true,
            "DietaryRestrictions has duplicates!"
        );

        Patron memory patron = patrons[_patron];

        patron.address_ = _patron;
        patron.joined = block.timestamp;

        Order memory order;

        // Procedurally, create bowl to add to patron's list of `orders`
        if (uint256(_wbs[0]) != 0) order.wbs = _wbs; // 1
        if (uint256(_feats[0]) != 0) order.feats = _feats; // 2
        if (uint256(_salads[0]) != 0) order.salads = _salads; // 3
        if (_cyos.length > 0) order.cyos = _cyos; // 4
        if (uint256(_sides[0]) != 0) order.sides = _sides; // 5
        if (uint256(_bevs[0]) != 0) order.bevs = _bevs; // 6
        if (uint256(_drs[0]) != 0) order.drs = _drs; // 7

        uint256 cost = totalCost(order);

        emit Order__Added(_patron, block.timestamp, cost, order);

        return order;
    }

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

    /**
     * @dev Checks if the `DietaryRestriction[]` array has duplicates.
     */
    function drsHasDuplicates(DietaryRestriction[] memory drs)
        public
        view
        returns (bool)
    {
        DietaryRestriction diary = DietaryRestriction.Diary;
        DietaryRestriction meat = DietaryRestriction.Meat;
        DietaryRestriction nuts = DietaryRestriction.Nuts;
        DietaryRestriction gluten = DietaryRestriction.Gluten;
        DietaryRestriction fish = DietaryRestriction.Fish;
        DietaryRestriction soy = DietaryRestriction.Soy;

        /**
         * @todo Check if `drs` input array is a subset of `uniqueDRs` array
         */
        if (
            keccak256(abi.encodePacked(uniqueDRs)) ==
            keccak256(abi.encodePacked(drs)) || // unique == drs
            keccak256(abi.encodePacked(diary)) ==
            keccak256(abi.encodePacked((drs[0]))) || // diary == drs[0]
            keccak256(abi.encodePacked(meat)) ==
            keccak256(abi.encodePacked((drs[0]))) // meat == drs[0]
            keccak256(abi.encodePacked(nuts)) ==
            keccak256(abi.encodePacked((drs[0]))) // nuts == drs[0]
            keccak256(abi.encodePacked(gluten)) ==
            keccak256(abi.encodePacked((drs[0]))) // gluten == drs[0]
            keccak256(abi.encodePacked(fish)) ==
            keccak256(abi.encodePacked((drs[0]))) // fish == drs[0]
            keccak256(abi.encodePacked(soy)) ==
            keccak256(abi.encodePacked((drs[0]))) // soy == drs[0]
            // check for size 2, 3, 4, 5, 6, and 7 arrays
            keccak256(abi.encodePacked(soy)) ==
            keccak256(abi.encodePacked((drs[0]))) // soy == drs[0]
        ) return true;
        if (
            keccak256(abi.encodePacked(uniqueDRs)) !=
            keccak256(abi.encodePacked(drs))
        ) return false;
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
