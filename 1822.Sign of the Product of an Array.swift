class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        var negativeCount = 0

        for num in nums {
            if num == 0 {
                return 0
            }

            if num < 0 {
                negativeCount += 1
            }
        }

        return negativeCount & 1 == 0 ? 1 : -1
    }
}
