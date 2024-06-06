class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        var map = [Int:Int]()

        for h in hand {
            map[h, default: 0] += 1
        }

        for startIdx in map.keys.sorted() {
            let startVal = map[startIdx]!

            if startVal <= 0 {
                continue
            }

            for i in stride(from: groupSize - 1, through: 0, by: -1) {
                if map[startIdx + i, default: 0] < startVal {
                    return false
                }

                map[startIdx + i] = map[startIdx + i, default: 0] - startVal
            }
        }

        return true
    }
}
