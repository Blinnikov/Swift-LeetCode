class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        var res = 1
        var nums = Array(repeating:0, count: n+1)
        nums[1] = 1
        
        for i in stride(from: 1, through: (n-1)/2, by: 1) {
            nums[2*i] = nums[i]
            nums[2*i+1] = nums[i] + nums[i+1]
            
            res = max(res, nums[2*i])
            res = max(res, nums[2*i+1])
        }
        
        return res
    }
}
