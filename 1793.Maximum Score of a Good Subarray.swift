class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        var i = k
        var j = k
        var minVal = nums[k]
        var score = nums[k]

        while i > 0 || j < nums.count - 1 {
            if i == 0 {
                j += 1
            } else if j == nums.count - 1 {
                i -= 1
            } else if nums[i - 1] < nums[j + 1] {
                j += 1
            } else {
                i -= 1
            }

            minVal = min(minVal, min(nums[i], nums[j]))
            score = max(score, minVal * (j - i + 1))
        }

        return score
    }
}
