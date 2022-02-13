// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

// Sweetgreen's menu library
contract SweetgreenMenu_Spring2022 {
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
    ) public {
        require(
            _wbs.length > 5,
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
            _drs.length < 6,
            "You tried adding more than the order limit for DietaryRestrictions!"
        );
        // @todo Restrict duplicates on the UI as well!
        require(
            drsHasDuplicates(_drs) == true,
            "DietaryRestrictions has duplicates!"
        );

        if (
            keccak256(abi.encode(patrons[_patron].address_)) !=
            keccak256(abi.encodePacked(""))
        ) {
            Patron patron = patrons[_patron]; // fetch stored Patron
        } else {
            Patron memory patron;

            // patron.orders = [];
            patron.address_ = _patron;
            patron.joined = block.timestamp;

            patrons[_patron] = patron; // create and store new Patron
        }

        // Procedurally, create bowl
        if (uint256(_wbs[0]) != 0) order.wbs = _wbs;
        if (uint256(_feats[0]) != 0) order.feats = _feats;
        if (uint256(_salads[0]) != 0) order.salads = _salads;
        if (_cyos.length > 0) order.cyos = _cyos;
        if (uint256(_sides[0]) != 0) order.sides = _sides;
        if (uint256(_drs[0]) != 0) order.drs = _drs;

        uint256 cost = totalCost(order);

        patron.orders.push(order);
        emit Order__Added(order, cost, block.timestamp);
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
     * @dev Checks whether the `DietaryRestriction[]` array has duplicates.
     */
    function drsHasDuplicates(DietaryRestriction[] memory drs)
        public
        returns (bool)
    {
        if (
            keccak256(abi.encodePacked(uniqueDRs)) ==
            keccak256(abi.encodePacked(drs))
        ) return true;
        if (
            keccak256(abi.encodePacked(uniqueDRs)) ==
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
     * @dev Events for `Order`s
     */
    event Order__Added(Order order, uint256 cost, uint256 timestamp);

    /**
     * @dev Emitted when an order is made.
     */
    event Ordered(
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

    Beverage[] bevs;

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
