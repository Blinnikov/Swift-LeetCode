class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var map = [Int:Int]()

        for el in target {
            map[el, default: 0] += 1
        }

        for a in arr {
            if map[a] == nil {
                return false
            }

            map[a, default: 0] -= 1

            if map[a] == 0 {
                map[a] = nil
            }
        }

        return map.count == 0
    }
}
