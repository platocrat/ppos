export enum Side {
  None,
  MisoRoastedVeggies, // seasonal
  RosemaryFocaccia
}

export enum Beverage {
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
export enum WarmBowlEnum {
  ChickenTostado, // online only
  HarvestBowl,
  ChickenPestoParm,
  Shroomami, // earth friendly pick
  FishTaco,
  CrispyRiceBowl // earth friendly pick
}

export enum Featured {
  None,
  AvocadoChickpeaCrunch,
  HotHoneyChicken,
  ValkryaesExtraCrispyCustom, // seasonal
  SteelheadRemoulade, // seasonal
  MisoBowl, // seasonal
  PotatoSaladSalad, // seasonal
  CrispyChickenSalad // seasonal
}

export enum SaladEnum {
  None,
  FarmhouseCaesar,
  GuacamoleGreens,
  KaleCaesar,
  BuffaloChickenBowl,
  SuperGreenGoddess,
  GardenCobb
}

export type Ingredient = {
  name: string,
  usdPrice: string
  calories: string
  imgUrl: string
}

export enum AddBreadToBowl {
  Yes,
  No
}

export enum Base {
  None,
  ChoppedRomaine,
  Arugula,
  BabySpinach,
  SpringMix,
  ShreddedKale,
  WarmWildRice,
  WarmQuinoa
}

export enum Topping {
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

export enum Premium {
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

export enum Dressing {
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

export enum DietaryRestriction {
  Diary,
  Meat,
  Nuts,
  Gluten,
  Fish,
  Soy
}

// export type WarmBowlDefault__Type = {
//   bases: Ingredient[]
//   toppings: Ingredient[]
//   premiums: Ingredient[]
//   dressings: Ingredient[]
//   addBread: boolean
// }

export type WarmBowl__Enum = {
  bases: Base[]
  toppings: Topping[]
  premiums: Premium[]
  dressings: Dressing[]
}

export type WarmBowlObject = {
  bases: Ingredient[]
  toppings: Ingredient[]
  premiums: Ingredient[]
  dressings: Ingredient[]
}

export type WarmBowlDisplay = {
  name: string
  usdPrice: string
  description: string
  calories: string,
  imgUrl: string
}

export type AvailableWarmBowlsDisplay = {
  0:  WarmBowlDisplay,
  1:  WarmBowlDisplay,
  2:  WarmBowlDisplay,
  3:  WarmBowlDisplay,
  4:  WarmBowlDisplay,
  5:  WarmBowlDisplay
}

export type CreateYourOwn = {
  bases: number[] // max 2
  toppings: number[] // max 10, max 2 per topping
  premiums: number[] // max 5
  dressings: number[] // max 3, max 1 per dressing
  addBread: boolean
}

export type SaladObject = {

}