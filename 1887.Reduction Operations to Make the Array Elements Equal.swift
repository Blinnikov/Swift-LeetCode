class Solution {
    func reductionOperations(_ nums: [Int]) -> Int {
        let nums = nums.sorted { $0 > $1 }
        
        var res = 0

        for i in 0..<nums.count - 1 {
            if nums[i + 1] < nums[i] {
                res += i + 1
            }
        }

        return res
    }
}
