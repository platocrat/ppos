import { CreateYourOwn__Type } from './types'

function addToBag(
  _wbs?: number[], // SgMenu__Spring2022.WarmBowl[] memory
  _salads?: number[], // SgMenu__Spring2022.Salad[] memory
  _feats?, // SgMenu__Spring2022.Featured[] memory
  _cyos?: CreateYourOwn__Type[], // SgMenu__Spring2022.CreateYourOwn[] memory
  _sides?, // SgMenu__Spring2022.Side[] memory
  _bevs?, // SgMenu__Spring2022.Beverage[] memory
  _drs? // SgMenu__Spring2022.DietaryRestriction[]
) {
  if ((_salads?.length + _cyos?.length) > 40) {
    throw new Error(`Hey now! You've hit the max order size (40/salads/bowls) at Westwood.`)
    
  }
}