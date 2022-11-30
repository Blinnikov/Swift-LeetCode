class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int:Int]()
        for num in arr {
            map[num] = map[num, default: 0] + 1
        }

        let set = Set(map.values)
        return map.count == set.count
    }
}
