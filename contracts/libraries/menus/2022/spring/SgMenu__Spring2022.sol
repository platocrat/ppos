// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.15;

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
        Base[] bases;
        Topping[] toppings;
        Premium[] premiums;
        Dressing[] dressings;
    }

    enum Side {
        RosemaryFocaccia,
        RoastedSweetPotatoesGreenGoddessRanch,
        None
    }

    enum Beverage {
        HealthAde__PinkLadyApple,
        HealthAde__Pomegrante,
        JasmineGreenTea,
        HibiscusCloverTea,
        Spindrift__RaspberryLime,
        Spindrift__Grapefruit,
        StillWater,
        SparklingWater,
        None
    }

    /*********************
     * Main course stuff *
     ********************/
    enum Featured {
        ChickenGoatCheesePesto, // seasonal + online only
        ChimichurriProteinPlate, // seasonal + online only
        MushroomChimichurri, // seasonal + online only
        ChickenChimichurri, // seasonal
        HotHoneyChicken,
        None
    }

    enum WarmBowl {
        ChickenTostado, // online only
        HarvestBowl,
        ChickenPestoParm,
        Shroomami, // earth friendly pick
        FishTaco,
        CrispyRiceBowl // earth friendly pick
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
        WarmQuinoa,
        ChoppedRomaine,
        Arugula,
        BabySpinach,
        SpringMix,
        ShreddedKale,
        WarmWildRice,
        None
    }

    enum Topping {
        Apples,
        Basil,
        RawCarrots,
        Chickpeas,
        Cilantro,
        Cucumber,
        RawBeet,
        RawOnion,
        RoastedSweetPotato,
        ShreddedCabbage,
        SpicyBroccoli,
        Tomato,
        Lentils,
        SpicySunflowerSeeds,
        CrispyRice,
        ToastedAlmonds,
        TortillaChips,
        ZaatarBreadcrumbs,
        None
    }

    enum Premium {
        BlackenedChicken,
        KaleCabbageSlaw,
        freshLemonyAsparagus,
        MisoRootVegetables,
        PickeledCarrotsCelery,
        BlueCheese,
        GoatCheese,
        ShavedParmesan,
        HardBoiledEgg,
        HotRoastedSweetPotatoes,
        Avocado,
        RoastedSesameTofu,
        WarmPortobelloMix,
        RoastedChicken,
        Steelhead,
        None
    }

    enum Dressing {
        ChimichurriVinaigrette,
        GreenGoddessRanch,
        BalsamicVinaigrette,
        BalsamicVinegar,
        CaesarDressing,
        ExtraVirginOliveOil,
        LimeCilantroJalapenoVinaigrette,
        MisoSesameGingerDressing,
        PestoVinaigrette,
        SpicyCashewDressing,
        SweetgreenHotSauce,
        HotHoneySauce,
        FreshLimeSqueeze,
        FreshLemonSqueeze,
        RedChilli,
        None
    }

    enum DietaryRestriction {
        Diary,
        Meat,
        Nuts,
        Gluten,
        Fish,
        Soy
    }

    struct DRtoCompare {
        uint256 diary;
        uint256 fish;
        uint256 gluten;
        uint256 meat;
        uint256 nuts;
        uint256 soy;
    }

    function hasNoDuplicates(DietaryRestriction[] memory drs)
        public
        pure
        returns (bool)
    {
        DRtoCompare memory drsToCompare;

        for (uint256 i = 0; i < drs.length; i++) {
            if (drs[i] == SgMenu__Spring2022.DietaryRestriction.Diary) {
                ++drsToCompare.diary;
            }
            if (drs[i] == SgMenu__Spring2022.DietaryRestriction.Fish) {
                ++drsToCompare.fish;
            }
            if (drs[i] == SgMenu__Spring2022.DietaryRestriction.Gluten) {
                ++drsToCompare.gluten;
            }
            if (drs[i] == SgMenu__Spring2022.DietaryRestriction.Meat) {
                ++drsToCompare.meat;
            }
            if (drs[i] == SgMenu__Spring2022.DietaryRestriction.Nuts) {
                ++drsToCompare.nuts;
            }
            if (drs[i] == SgMenu__Spring2022.DietaryRestriction.Soy) {
                ++drsToCompare.soy;
            }
        }

        if (
            drsToCompare.diary > 1 ||
            drsToCompare.fish > 1 ||
            drsToCompare.gluten > 1 ||
            drsToCompare.meat > 1 ||
            drsToCompare.nuts > 1 ||
            drsToCompare.soy > 1
        ) {
            return true;
        } else {
            return false;
        }
    }
}
