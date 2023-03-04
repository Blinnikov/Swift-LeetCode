class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var res = 0

        var minIdx = -1
        var maxIdx = -1
        var stopIdx = -1

        for i in 0..<nums.count {
            if nums[i] < minK || nums[i] > maxK {
                stopIdx = i
            }

            if nums[i] == minK {
                minIdx = i
            }

            if nums[i] == maxK {
                maxIdx = i
            }

            res += max(0, min(minIdx, maxIdx) - stopIdx)
        }

        return res
    }
}
