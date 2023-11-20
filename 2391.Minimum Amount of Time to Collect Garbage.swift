class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var ps = [0] + travel

        for i in 1..<ps.count {
            ps[i] += ps[i - 1]
        }

        var pickUpTime = 0

        var lastHouseWithMetal = -1
        var lastHouseWithPaper = -1
        var lastHouseWithGlass = -1

        for i in 0..<garbage.count {
            let house = garbage[i]

            for trash in house {
                switch(trash) {
                    case "M": lastHouseWithMetal = i
                    case "P": lastHouseWithPaper = i
                    case "G": lastHouseWithGlass = i
                    default: continue
                }
                
                pickUpTime += 1
            }
        }

        var metalTime = lastHouseWithMetal == -1 ? 0 : ps[lastHouseWithMetal]
        var paperTime = lastHouseWithPaper == -1 ? 0 : ps[lastHouseWithPaper]
        var glassTime = lastHouseWithGlass == -1 ? 0 : ps[lastHouseWithGlass]

        return pickUpTime + metalTime + paperTime + glassTime
    }
}
