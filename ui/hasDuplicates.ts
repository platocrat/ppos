/**
 * @dev Check if `drs` array is subset of `uniqueDRs` array
 * @todo Add this function to the UI component that sets the value of the user's
 *       selection of dietary restriction
 */
 enum DietaryRestriction {
  None, // 0
  Diary,
  Fish,
  Gluten,
  Meat,
  Nuts,
  Soy // 6
}

const uniqueDRs = [
  DietaryRestriction.Diary,
  DietaryRestriction.Fish,
  DietaryRestriction.Gluten,
  DietaryRestriction.Meat,
  DietaryRestriction.Nuts,
  DietaryRestriction.Soy
]

const hasDuplicates = (drs: DietaryRestriction[]): boolean => {
  let s = new Set,
    m = uniqueDRs.length,
    n = drs.length

  for (let i = 0; i < m; i++) {
    s.add(uniqueDRs[i])
  }

  let p = s.size

  for (let i = 0; i < n; i++) {
    s.add(drs[i])
  }

  if (s.size == p) return true
  else return false
}