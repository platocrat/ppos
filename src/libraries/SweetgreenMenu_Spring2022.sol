// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

// Sweetgreen's menu library
contract SweetgreenMenu_Spring2022 {
    mapping(address => Patron) patrons;

    /**
     * @dev Array of patrons' orders
     */
    Order[] orders;

    function createOrder(
        address _patron,
        WarmBowls warmBowls,
        Salads salads,
        CreateYourOwn memory createYourOwn,
        Sides sides,
        Beverages beverages,
        DietaryRestrictions dietaryRestrictions
    ) public {
        Order memory order;
        Patron memory patron_ = patrons[_patron];

        order.warmBowls = warmBowls;
    }

    function addOrderToBag(
        address _patron,
        Order memory _order,
        uint256 _quantity,
        uint256 _cost
    ) public {
        Patron storage currentPatron = patrons[_patron];

        // Add order to patron's list of orders
        for (uint256 i = 0; i < _quantity; i++) {
            currentPatron.orders.push(_order);
            emit Ordered(_patron, block.timestamp, _cost, _order);
        }

        // patron = Order(
        //     _order.warmBowls,
        //     _order.salads,
        //     _order.createYourOwn,
        //     _order.sides,
        //     _order.beverages,
        //     _order.dietaryRestrictions
        // );

        // patrons[_patron] = Patron(_order)

        // patrons[_patron] = Patron(_order, _patron, _quantity);
    }

    /**
     * @dev Emitted when an order is made.
     */
    event Ordered(
        address indexed address_,
        uint256 indexed timestamp,
        uint256 cost,
        Order[] orders
    );

    struct Patron {
        Order[] orders;
        address address_;
        uint256 joined;
    }

    struct Order {
        uint256[] warmBowls; // `WarmBowl` enum array
        uint256[] salads; // `Salad` enum array
        CreateYourOwn[] createYourOwn; // `CreateYourOwn` struct array
        uint256[] sides; // `Sides` enum array
        uint256[] beverages; // // `Beverages` enum array
        uint256[] dietaryRestrictions; // `DietaryRestrictions` enum array
    }

    enum Sides {
        MISO_ROASTED_VEGGIES, // seasonal
        ROSEMARY_FOCACCIA
    }

    Sides side;

    enum Beverages {
        HEALTH_ADE_PINK_LADY_APPLE,
        HEALTH_ADE_POMEGRANATE,
        JASMINE_GREEN_TEA,
        HIBISCUS_CLOVER_TEA,
        SPINDRIFT_RASPBERRY_LIME,
        SPINDRIFT_GRAPEFRUIT,
        STILL_WATER,
        SPARKLING_WATER
    }

    Beverages bev;

    enum Salads {
        FARMHOUSE_CAESAR,
        GUACAMOLE_GREENS,
        KALE_CAESAR,
        BUFFALO_CHICKEN_BOWL,
        SUPER_GREEN_GODDESS,
        GARDEN_COBB
    }

    /********************
     * Main course stuff *
     ********************/
    enum WarmBowls {
        FEATURED,
        CREATEYOUROWN
    }

    WarmBowls warmBowl;

    enum Featured {
        AVOCADO_CHICKPEA_CRUNCH,
        HOT_HONEY_CHICKEN,
        VALKYRAES_EXTRA_CRISPY_CUSTOM, // seasonal
        STEELHEAD_REMOULADE, // seasonal
        MISO_BOWL, // seasonal
        POTATO_SALAD_SALAD, // seasonal
        CRISPY_CHICKEN_SALAD // seasonal
    }

    Featured featured;

    /***************************************
     * struct and enums for `CreateYourOwn` *
     ***************************************/
    struct CreateYourOwn {
        Base[] base;
        Toppings[] toppings;
        Premiums[] premiums;
        Dressings dressings;
    }

    enum AddBreadToBowl {
        YES,
        NO
    }

    AddBreadToBowl abtb;

    enum Base {
        CHOPPED_ROMAINE,
        ARUGLA,
        BABY_SPINACH,
        SPRING_MIX,
        SHREDDED_KALE,
        WARM_WILD_RICE,
        WARM_QUINOA
    }

    Base base;

    enum Toppings {
        CHOPPED_PICKLES,
        RAISINS,
        APPLES,
        BASIL,
        RAW_CARROTS,
        CHICKPEAS,
        CILANTRO,
        CUCUMBER,
        RAW_BEET,
        RED_ONION,
        ROASTED_SWEET_POTATO,
        SHREDDED_CABBAGE,
        SPICY_BROCCOLI,
        TOMATO,
        LENTILS,
        SPICY_SUNFLOWER_SEEDS,
        CRISPY_RICE,
        TOASTED_ALMONDS,
        TORTILLA_CHIPS,
        ZAATAR_BREADCRUMBS
    }

    Toppings[] toppings;

    enum Premiums {
        MISO_ROOT_VEGETABLES,
        PICKELED_CARROTS_CELERY,
        BLUE_CHEESE,
        GOAT_CHEESE,
        SHAVED_PARMESAN,
        PARMESAN_CRISP,
        HARD_BOILED_EGG,
        HOT_ROASTED_SWEET_POTATOES,
        AVOCADO,
        ROASTED_SESAME_TOFU,
        WARM_PORTOBELLO_MIX,
        BLACKENED_CHICKEN,
        ROASTED_CHICKEN,
        STEELHEAD
    }

    Premiums[] premiums;

    enum Dressings {
        REMOULADE_DRESSNG,
        GREEN_GODDESS_RANCH_DRESSING,
        BALSAMIC_VINAIGRETTE,
        BALSAMIC_VINEGAR,
        CAESAR_DRESSING,
        EXTRA_VIRIN_OLIVE_OIL,
        LIME_CILANTRO_JALAPENO_VINAIGRETTE,
        MISO_SESAME_GINGER_DRESSING,
        PESTO_VINAIGRETTE,
        SPICY_CASHEW_DRESSING,
        SWEETGREEN_HOT_SAUCE,
        FRESH_LIME_SQUEEZE,
        FRESH_LEMON_SQUEEZE,
        RED_CHILLI
    }

    Dressings[] dressings;

    enum DietaryRestrictions {
        DIARY,
        MEAT,
        NUTS,
        GLUTEN,
        FISH,
        SOY
    }

    DietaryRestrictions[] dietaryRestrictions;
}
