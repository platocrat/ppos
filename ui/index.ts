import {
  AvailableWarmBowlsDisplay,
  Base,
  CreateYourOwn,
  Dressing,
  Premium,
  Topping,
  WarmBowlEnum,
  WarmBowlObject,
  WarmBowl__Enum,
} from './types'

import {
  babySpinachObj,
  warmQuinoaObj,
  zaatarBreadcrumbsObj,
  tomatoesObj,
  spicyBroccoliObj,
  roastedChickenObj,
  shavedParmesanObj,
  sweetgreenHotSauceObj,
  pestoVinaigretteObj,
  chickenTostado__WblEnum,
  chickenTostado__WblObj,
  harvestBowl__WblEnum,
  harvestBowl__WblObj,
  chickenPestoParm__WblEnum,
  chickenPestoParm__WblObj,
  shroomami__WblEnum,
  shroomami__WblObj,
  fishTaco__WblEnum,
  fishTaco__WblObj,
  crispyRiceBowl__WblEnum,
  crispyRiceBowl__WblObj
} from './constants'



/**
 * @dev Called when the `Modify` or cicular `+` button is clicked
 * @notice The corclar `+` button is only visible when `isModiied` is false 
 */
const toggleModify = () => {
  setIsModified(!isModified)
}

/************************
* Add items to WarmBowl *
************************/
function addBase(_selectedWbl: WarmBowl__Enum, _base: Base) {
  _selectedWbl.bases.push(_base)
  return _selectedWbl
}

function addTopping(_selectedWbl: WarmBowl__Enum, _topping: Topping) {
  _selectedWbl.toppings.push(_topping)
  return _selectedWbl
}

function addPremium(_selectedWbl: WarmBowl__Enum, _premium: Premium) {
  _selectedWbl.premiums.push(_premium)
  return _selectedWbl
}

function addDressing(_selectedWbl: WarmBowl__Enum, _dressing: Dressing) {
  _selectedWbl.dressings.push(_dressing)
  return _selectedWbl
}


/*****************************
* Remove items from WarmBowl *
*****************************/
function removeBase(_selectedWbl: WarmBowl__Enum, _base: Base) {
  return _selectedWbl.bases.filter(base => base !== _base)
}

function removeTopping(_selectedWbl: WarmBowl__Enum, _topping: Topping) {
  return _selectedWbl.toppings.filter(topping => topping !== _topping)
}

function removePremium(_selectedWbl: WarmBowl__Enum, _premium: Premium) {
  return _selectedWbl.premiums.filter(premium => premium !== _premium)
}

function removeDressings(_selectedWbl: WarmBowl__Enum, _dressings: Dressing) {
  return _selectedWbl.dressings.filter(dressings => dressings !== _dressings)
}

/********************
* Create a WarmBowl *
*********************/
function preventAdditionalModifications(_wbl: WarmBowl__Enum) {
  if (_wbl.bases.length == 2) {
    return Error(`You've reached the maximum number of modifications`)
  }

  if (_wbl.toppings.length == 10) {

  }

  if (_wbl.premiums.length == 5) {

  }

  if (_wbl.premiums.length == 3) {

  }
}


/********************
* Create a WarmBowl *
*********************/
/**
 * @todo Use the returned `WblObj`s to get the total cost of a user's bowl
 */
function createWbl(wblEnum?: WarmBowlEnum) {
  if (wblEnum === 0) return [chickenTostado__WblEnum, chickenTostado__WblObj]
  if (wblEnum === 1) return [harvestBowl__WblEnum, harvestBowl__WblObj]
  if (wblEnum === 2) return [chickenPestoParm__WblEnum, chickenPestoParm__WblObj]
  if (wblEnum === 3) return [shroomami__WblEnum, shroomami__WblObj]
  if (wblEnum === 4) return [fishTaco__WblEnum, fishTaco__WblObj]
  if (wblEnum === 5) return [crispyRiceBowl__WblEnum, crispyRiceBowl__WblObj]
}

/**
 * @todo call this if statement after the user has selected `ChickenPestoParm` 
 *       from the list of available bowls
 */
// if (selectedWbl === 'ChickenPestoParm') {
//   setWarmBowl(createWbl(chickenPestoParm))
// }


const selectBowl = (isWarmBowl: boolean, warmBowlEnum: WarmBowlEnum) => {
  let wblObj: (WarmBowl__Enum | WarmBowlObject)[]
  if (isWarmBowl === true && warmBowlEnum) wblObj = createWbl(warmBowlEnum)
  return wblObj
}



function totalCost(
  _wbs: number[], // SgMenu__Spring2022.WarmBowl[] memory
  _salads, // SgMenu__Spring2022.Salad[] memory
  _feats, // SgMenu__Spring2022.Featured[] memory
  _cyos: CreateYourOwn[], // SgMenu__Spring2022.CreateYourOwn[] memory
  _sides, // SgMenu__Spring2022.Side[] memory
  _bevs, // SgMenu__Spring2022.Beverage[] memory
  _drs // SgMenu__Spring2022.DietaryRestriction[]
) {
  _wbs
}
