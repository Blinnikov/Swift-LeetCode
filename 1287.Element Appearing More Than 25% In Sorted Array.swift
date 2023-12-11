class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        var map = [Int:Int]()

        for el in arr {
            map[el, default: 0] += 1
        }

        return map.sorted { $0.value > $1.value }[0].key
    }
}
