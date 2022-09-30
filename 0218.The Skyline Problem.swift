struct BuildingPoint {
    var x: Int
    var isStart: Bool
    var height: Int
}

extension BuildingPoint: Comparable {
    static func <(_ lhs: BuildingPoint, _ rhs: BuildingPoint) -> Bool {
        if lhs.x != rhs.x {
            return lhs.x < rhs.x
        } else {
            if lhs.isStart && rhs.isStart {
                return lhs.height > rhs.height
            } else if !lhs.isStart && !rhs.isStart {
                return lhs.height < rhs.height
            } else {
                return lhs.isStart ? true : false
            }
        }
        return false
    }
}

class Solution {
    var res  = [[Int]]()
    var prevMaxHeight = 0

    var heightKeeper = [Int:Int]()
    var buildingPoints: [BuildingPoint] = []
    
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        for b in buildings {
            buildingPoints.append(BuildingPoint(x: b[0], isStart: true, height: b[2]))
            buildingPoints.append(BuildingPoint(x: b[1], isStart: false, height: b[2]))
        }

        buildingPoints.sort()
  
        heightKeeper[0] = 1
        for b in buildingPoints {
            var currentMaxHeight = prevMaxHeight
            if b.isStart {
                heightKeeper[b.height, default: 0] += 1
                currentMaxHeight = max(currentMaxHeight, b.height)
            } else {
                if let val = heightKeeper[b.height] {
                    if val == 1 {
                       heightKeeper[b.height] = nil
                       
                        if let maximumHeightPresentInDictionary = heightKeeper.keys.max() {
                            currentMaxHeight = maximumHeightPresentInDictionary
                        }
                    } else {
                       heightKeeper[b.height] = val - 1
                    }
                }
            }
            
            if prevMaxHeight != currentMaxHeight {
               res.append(Array([b.x, currentMaxHeight]))
               prevMaxHeight = currentMaxHeight
            }
        }
        
        return res
    }
}
