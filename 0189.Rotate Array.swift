class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 {
            return
        }
        
        var temp = Array(repeating: 0, count: nums.count)
        
        for i in 0..<nums.count {
            var pos = i-k
            while pos < 0 {
                pos += nums.count
            }
            
            // print(i, pos)
            
            temp[i] = nums[pos]
        }
        
        nums = temp
    }
}
