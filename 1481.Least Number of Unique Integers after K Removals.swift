class Solution {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        var map = [Int:Int]()

        for n in arr {
            map[n, default: 0] += 1
        }

        var values = map.values.sorted()

        var k = k
        for i in 0..<values.count {
            if k > values[i] {
                k -= values[i]
            } else if k < values[i] {
                return values.count - i
            } else {
                return values.count - i - 1
            }
        }

        return 0
    }
}
