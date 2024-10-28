class Solution {
    func longestSquareStreak(_ nums: [Int]) -> Int {
        let set = Set(nums)

        var res = 0

        for n in nums {
            var count = 0
            var curr = n

            while set.contains(curr) {
                count += 1

                if curr > 100_000 {
                    break
                }

                curr *= curr

                res = max(res, count)
            }
        }

        return res < 2 ? -1 : res
    }
}
