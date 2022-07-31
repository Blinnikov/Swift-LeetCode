class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k % nums.count
        reverse(&nums, 0, nums.count-k-1)
        reverse(&nums, nums.count-k, nums.count-1)
        reverse(&nums, 0, nums.count-1)
    }
    
    private func reverse(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
        var lo = lo, hi = hi
        var temp: Int
        
        while lo < hi {
            temp = nums[lo]
            nums[lo] = nums[hi]
            nums[hi] = temp
            
            lo += 1
            hi -= 1
        }
    }
    
    func rotate1(_ nums: inout [Int], _ k: Int) {
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
