class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var res = 0
        var count = Array(repeating: [Int:Int](), count: nums.count)

        for i in 0..<nums.count {
            for j in 0..<i {
                let delta = nums[i] - nums[j]
                if delta < Int.min || delta > Int.max {
                    continue
                }

                let sum = count[j][delta, default: 0]
                let origin = count[i][delta, default: 0]
                count[i][delta] = origin + sum + 1
                res += sum
            }
        }
        
        return res
    }
}
