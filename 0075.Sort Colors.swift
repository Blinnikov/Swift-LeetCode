class Solution {
    func sortColors(_ nums: inout [Int]) {
        var colorsCount = Array(repeating: 0, count: 3)

        for n in nums {
            colorsCount[n] += 1
        }

        var idx = 0

        for i in 0..<3 {
            while colorsCount[i] > 0 {
                nums[idx] = i
                colorsCount[i] -= 1
                idx += 1
            }
        }
    }
}
