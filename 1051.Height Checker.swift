class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var sorted = heights.sorted()
        var res = 0

        for i in 0..<heights.count {
            if sorted[i] != heights[i] {
                res += 1
            }
        }

        return res
    }
}
