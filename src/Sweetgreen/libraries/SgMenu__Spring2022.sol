// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

// Sweetgreen's menu library
library SgMenu__Spring2022 {
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
