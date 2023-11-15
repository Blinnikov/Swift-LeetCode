class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        var arr = arr.sorted()

        var res = 0

        for el in arr {
            res = min(res + 1, el)
        }

        return res
    }
}
