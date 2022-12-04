class Solution {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        var res = -1
        var minDiff = Int.max

        var psa = Array(repeating: 0, count: nums.count + 1)
        var ssa = Array(repeating: 0, count: nums.count + 1)

        for i in 0..<nums.count {
            psa[i + 1] = psa[i] + nums[i]
        }

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            ssa[i] = ssa[i + 1] + nums[i]
        }

        for i in 0..<nums.count {
            let leftAvg = psa[i + 1] / (i + 1)
            let rightAvg = i != nums.count - 1 ? ssa[i + 1] / (nums.count - i - 1) : ssa[i + 1]
            let diff = abs(leftAvg - rightAvg)

            if diff < minDiff {
                minDiff = diff
                res = i
            }
        }

        return res
    }
}
