import { AvailableWarmBowlsDisplay, Base, Dressing, Ingredient, Premium, Topping, WarmBowlObject, WarmBowl__Enum } from "./types"



/*****************************************
 *               INGREDIENTS             *
 ****************************************/
/********************
 * Ingredient Bases *
 *******************/
/**
 * @dev Max 2 per WarmBowl
 */
export const babySpinachObj: Ingredient = {
  name: 'Baby Spinach',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const warmQuinoaObj: Ingredient = {
  name: 'Warm Quinoa',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const choppedRomaineObj: Ingredient = {
  name: 'Chopped Romaine',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const arugulaObj: Ingredient = {
  name: 'Arugula',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const springMixObj: Ingredient = {
  name: 'Spring Mix',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const shreddedKaleObj: Ingredient = {
  name: 'Shredded Kale',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const warmWildRiceObj: Ingredient = {
  name: 'Warm Wild Rice',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

/***************
 * Base Enums *
 **************/
/**
 * @dev Max 2 per WarmBowl
 */
export const warmQuinoaEnum: Base = 0
export const babySpinachEnum: Base = 1
export const choppedRomaineEnum: Base = 2
export const arugulaEnum: Base = 3
export const springMixEnum: Base = 4
export const shreddedKaleEnum: Base = 5
export const warmWildRiceEnum: Base = 6

/*******************
 * Topping Objects *
 ******************/
/**
 * @dev Max 10 per WarmBowl
 */
export const tortillaChipsObj: Ingredient = {
  name: 'TortillaChips',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const rawCarrotsObj: Ingredient = {
  name: 'Raw Carrots',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const choppedPicklesObj: Ingredient = {
  name: 'Chopped Pickles',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const applesObj: Ingredient = {
  name: 'Apples',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const basilObj: Ingredient = {
  name: 'Basil',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const chickpeasObj: Ingredient = {
  name: 'Chickpeas',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const cucumberObj: Ingredient = {
  name: 'Cucumber',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const rawBeetObj: Ingredient = {
  name: 'Raw Beet',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const redOnionObj: Ingredient= {
  name: 'Red Onion',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const roastedSweetObj: Ingredient = {
  name: 'Roasted Sweet',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const shreddedCabbageObj: Ingredient = {
  name: 'Shredded Cabbage',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const lentilsObj: Ingredient = {
  name: 'Lentils',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const spicySunflowerSeedsObj: Ingredient = {
  name: 'Spicy Sunflower Seeds',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const crispyRiceObj: Ingredient = {
  name: 'Crispy Rice',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const toastedAlmondsObj: Ingredient = {
  name: 'Toasted Almonds',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const zaatarBreadcrumbsObj: Ingredient = {
  name: `Za'atar Breadcrumbs`,
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const spicyBroccoliObj: Ingredient = {
  name: 'Spicy Broccoli',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const tomatoesObj: Ingredient = {
  name: 'Tomatoes',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const cilantroObj: Ingredient = {
  name: 'Cilantro',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

/*****************
 * Topping Enums *
 ****************/
/**
 * @dev Max 10 per WarmBowl
 */
export const zaatarBreadcrumbsEnum: Topping = 0
export const tomatoesEnum: Topping = 1
export const spicyBroccoliEnum: Topping = 2
export const tortillaChipsEnum: Topping = 3
export const rawCarrotsEnum: Topping = 4
export const choppedPicklesEnum: Topping = 5
export const applesEnum: Topping = 6
export const basilEnum: Topping = 7
export const chickpeasEnum: Topping = 8
export const hotRoastedSweetPotatoesEnum: Topping = 9
export const cucumberEnum: Topping = 10
export const rawBeetEnum: Topping = 11
export const redOnionEnum: Topping = 12
export const roastedSweetEnum: Topping = 13
export const shreddedCabbageEnum: Topping = 14
export const lentilsEnum: Topping = 15
export const spicySunflowerSeedsEnum: Topping = 16
export const crispyRiceEnum: Topping = 17
export const toastedAlmondsEnum: Topping = 18
export const cilantroEnum: Topping = 19


/*******************
 * Premium Objects *
 ******************/
/**
 * @dev Max 5 per WarmBowl
 */
export const shavedParmesanObj: Ingredient = {
  name: 'Shaved Parmesan',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const roastedChickenObj: Ingredient = {
  name: 'Roasted Chicken',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const blackenedChickenObj: Ingredient = {
  name: 'Blackened Chicken',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const goatCheeseObj: Ingredient = {
  name: 'Goat Cheese',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const misoRootVegetablesObj: Ingredient = {
  name: 'Miso Root Vegetables',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const pickeledCarrotsAndCeleryObj: Ingredient = {
  name: 'Pickeled Carrots + Celery',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const blueCheeseObj: Ingredient = {
  name: 'Blue Cheese',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const parmesanCrispObj: Ingredient = {
  name: 'Parmesan Crisp',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const hardBoiledEggObj: Ingredient = {
  name: 'Hard Boiled Egg',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const hotRoastedSweetPotatoesObj: Ingredient = {
  name: 'Hot Roasted Sweet Potatoes',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const avocadoObj: Ingredient = {
  name: 'Avocado',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const roastedSesameTofuObj: Ingredient = {
  name: 'Roasted Sesame Tofu',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const warmPortobelloMixObj: Ingredient = {
  name: 'Warm Portobello Mix',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const steelheadObj: Ingredient = {
  name: 'Steelhead',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

/*****************
 * Premium Enums *
 ****************/
/**
 * @dev Max 5 per WarmBowl
 */
export const roastedChickenEnum: Premium = 0
 export const shavedParmesanEnum: Premium = 1
export const blackenedChickenEnum: Premium = 2
export const goatCheeseEnum: Premium = 3
export const misoRootVegetablesEnum: Premium = 4
export const pickeledCarrotsAndCeleryEnum: Premium = 5
export const blueCheeseEnum: Premium = 6
export const parmesanCrispEnum: Premium = 7
export const hardBoiledEggEnum: Premium = 8
export const avocadoEnum: Premium = 9
export const roastedSesameTofuEnum: Premium = 10
export const warmPortobelloMixEnum: Premium = 11
export const steelheadEnum: Premium = 12

/********************
 * Dressing Objects *
 *******************/
/**
 * @dev Max 3 per WarmBowl
 */
export const limeCilantroJalapenoObj: Ingredient = {
  name: 'Lime Cilantro Jalapeno',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const sweetgreenHotSauceObj: Ingredient = {
  name: 'Sg Hot Sauce',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const pestoVinaigretteObj: Ingredient = {
  name: 'Pesto Vinaigrette',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const remouladeDressingObj: Ingredient = {
  name: 'Remoulade Dressing',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const greenGoddessRanchDressingObj: Ingredient = {
  name: 'Green Goddess Ranch Dressing',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const balsamicVinaigretteObj: Ingredient = {
  name: 'Balsamic Vinaigrette',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const balsamicVinegarObj: Ingredient = {
  name: 'Balsamic Vinegar',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const caesarDressingObj: Ingredient = {
  name: 'Caesar Dressing',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const extraVirginOliveOilObj: Ingredient = {
  name: 'Extra Virgin Olive Oil',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const misoSesameGingerDressingObj: Ingredient = {
  name: 'Miso Sesame Ginger Dressing',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const spicyCashewDressingObj: Ingredient = {
  name: 'Spicy Cashew Dressing',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const freshLimeSqueezeObj: Ingredient = {
  name: 'Fresh Lime Squeeze',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const freshLemonSqueezeObj: Ingredient = {
  name: 'Fresh Lemon Squeeze',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

export const redChiliObj: Ingredient = {
  name: 'Red Chili',
  usdPrice: '100 hundo',
  calories: '999 cal',
  imgUrl: 'undefined'
}

/******************
 * Dressing Enums *
 *****************/
/**
 * @dev Max 3 per WarmBowl
 */
export const sweetgreenHotSauceEnum: Dressing = 0
export const pestoVinaigretteEnum: Dressing = 1
export const limeCilantroJalapenoEnum: Dressing = 2
export const remouladeDressingEnum: Dressing = 3
export const greenGoddessRanchDressingEnum: Dressing = 4
export const balsamicVinaigretteEnum: Dressing = 5
export const balsamicVinegarEnum: Dressing = 6
export const caesarDressingEnum: Dressing = 7
export const extraVirginOliveOilEnum: Dressing = 8
export const misoSesameGingerDressingEnum: Dressing = 9
export const spicyCashewDressingEnum: Dressing = 10
export const freshLimeSqueezeEnum: Dressing = 11
export const freshLemonSqueezeEnum: Dressing = 12
export const redChiliEnum: Dressing = 13

/*****************************
 * Warm bowl details-objects *
 ****************************/
 export const chickenPestoParm__WblObj: WarmBowlObject = {
  bases: [ warmQuinoaObj, babySpinachObj ],
  toppings: [ zaatarBreadcrumbsObj, tomatoesObj, spicyBroccoliObj ],
  premiums: [ roastedChickenObj, shavedParmesanObj ],
  dressings: [ sweetgreenHotSauceObj, pestoVinaigretteObj ]
}

export const chickenTostado__WblObj: WarmBowlObject = {
  bases: [ babySpinachObj, warmQuinoaObj ],
  toppings: [ cilantroObj, rawCarrotsObj, tomatoesObj, tortillaChipsObj ],
  premiums: [ blackenedChickenObj, goatCheeseObj ],
  dressings: [ sweetgreenHotSauceObj, limeCilantroJalapenoObj ]
}

export const harvestBowl__WblObj: WarmBowlObject = {
  bases: [ warmWildRiceObj, shreddedKaleObj ],
  toppings: [ hotRoastedSweetPotatoesObj, applesObj, toastedAlmondsObj ],
  premiums: [ roastedChickenObj, goatCheeseObj ],
  dressings: [ balsamicVinaigretteObj ]
}

export const shroomami__WblObj: WarmBowlObject = {
  bases: [ warmWildRiceObj, shreddedKaleObj ],
  toppings: [ cucumberObj, spicySunflowerSeedsObj, rawBeetObj, basilObj ],
  premiums: [ roastedSesameTofuObj, warmPortobelloMixObj ],
  dressings: [ misoRootVegetablesObj ]
}

export const fishTaco__WblObj: WarmBowlObject = {
  bases: [ arugulaObj, warmQuinoaObj ],
  toppings: [ cilantroObj, tortillaChipsObj, shreddedCabbageObj ],
  premiums: [ steelheadObj, avocadoObj ],
  dressings: [ sweetgreenHotSauceObj, limeCilantroJalapenoObj ]
}

export const crispyRiceBowl__WblObj: WarmBowlObject = {
  bases: [ warmWildRiceObj, arugulaObj ],
  toppings: [ cucumberObj, cilantroObj, rawCarrotsObj, crispyRiceObj, toastedAlmondsObj, shreddedCabbageObj ],
  premiums: [ blackenedChickenObj, spicyCashewDressingObj, freshLimeSqueezeObj ],
  dressings: [ sweetgreenHotSauceObj, limeCilantroJalapenoObj ]
}

/*****************************
 * Warm bowl enum-objects *
 ****************************/
 export const chickenPestoParm__WblEnum: WarmBowl__Enum = {
  bases: [ warmQuinoaEnum, babySpinachEnum ],
  toppings: [ zaatarBreadcrumbsEnum, tomatoesEnum, spicyBroccoliEnum ],
  premiums: [ roastedChickenEnum, shavedParmesanEnum ],
  dressings: [ sweetgreenHotSauceEnum, pestoVinaigretteEnum ]
}

export const chickenTostado__WblEnum: WarmBowl__Enum = {
  bases: [ babySpinachEnum, warmQuinoaEnum ],
  toppings: [ cilantroEnum, rawCarrotsEnum, tomatoesEnum, tortillaChipsEnum ],
  premiums: [ blackenedChickenEnum, goatCheeseEnum ],
  dressings: [ sweetgreenHotSauceEnum, limeCilantroJalapenoEnum ]
}

export const harvestBowl__WblEnum: WarmBowl__Enum = {
  bases: [ warmWildRiceEnum, shreddedKaleEnum ],
  toppings: [ hotRoastedSweetPotatoesEnum, applesEnum, toastedAlmondsEnum ],
  premiums: [ roastedChickenEnum, goatCheeseEnum ],
  dressings: [ balsamicVinaigretteEnum ]
}

export const shroomami__WblEnum: WarmBowl__Enum = {
  bases: [ warmWildRiceEnum, shreddedKaleEnum ],
  toppings: [ cucumberEnum, spicySunflowerSeedsEnum, rawBeetEnum, basilEnum ],
  premiums: [ roastedSesameTofuEnum, warmPortobelloMixEnum ],
  dressings: [ misoSesameGingerDressingEnum ]
}

export const fishTaco__WblEnum: WarmBowl__Enum = {
  bases: [ arugulaEnum, warmQuinoaEnum ],
  toppings: [ cilantroEnum, tortillaChipsEnum, shreddedCabbageEnum ],
  premiums: [ steelheadEnum, avocadoEnum ],
  dressings: [ sweetgreenHotSauceEnum, limeCilantroJalapenoEnum ]
}

export const crispyRiceBowl__WblEnum: WarmBowl__Enum = {
  bases: [ warmWildRiceEnum, arugulaEnum ],
  toppings: [ cucumberEnum, cilantroEnum, rawCarrotsEnum, crispyRiceEnum, toastedAlmondsEnum, shreddedCabbageEnum ],
  premiums: [ blackenedChickenEnum ],
  dressings: [ spicyCashewDressingEnum, freshLimeSqueezeEnum ]
}



/***********************
 * Available WarmBowls *
 **********************/
const availableWarmBowls: AvailableWarmBowlsDisplay = {
  0: {
    name: 'Chicken Tostado',
    usdPrice: '13.95',
    description: 'Warm quinoa, baby spinach, cilantro, tomato, tortilla chips, raw carrots, goat cheese, blackened chicken, lime cilantro jalapeno vinaigrette, sweetgreen hot sauce',
    calories: '625 cal',
    imgUrl: ''
  },
  1: {
    name: 'Harvest Bowl',
    usdPrice: '13.95', // in $USD,
    description: 'Shredded kale, warm wild rice, roasted sweet potato, toasted almonds, apples, goat cheese, roasted chicken, balsamic vinaigrette',
    calories: '685 cal',
    imgUrl: 'undefined' 
  },
  2: {
    name: 'Chicken Pesto Parm',
    usdPrice: '13.95',
    description: `Warm quinoa, baby spinach, spicy broccoli, tomato, za'atar breadcrumbs, roasted chicked, shaved parmesan, pesto vinaigrette, sweetgreen hot sauce`,
    calories: '525 cal',
    imgUrl: 'undefined' 
  },
  3: {
    name: 'Shroomami',
    description: 'Shredded kale, warm wild rice, basil, cucumber, raw beet, spicy sunflower seeds, roasted sesame tofu, warm portobello mix, miso sesame ginger dressing',
    usdPrice: '13.45',
    calories: '645 cal',
    imgUrl: 'undefined' 
  },
  4: {
    name: 'Fish Taco',
    description: 'Warm quinoa, arugula, cilantro, shredded cabbage, tortilla chips, avocado, steelhead, lime cilantro jalapeno vinaigrette, sweetgreen hot sauce',
    usdPrice: '14.95',
    calories: '715 cal',
    imgUrl: 'undefined' 
  },
  5: {
    name: 'Crispy Rice Bowl',
    description: 'Arugula, warm wild rice, cilantro, cucumber, shredded cabbage, toasted almonds, crispy rice, raw carrots, blackened chicked, fresh lime squeeze, spicy cashew dressing',
    usdPrice: '14.95',
    calories: '715 cal',
    imgUrl: 'undefined' 
  },
}