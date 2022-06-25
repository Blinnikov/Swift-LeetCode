class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        // print(nums)
        if nums.count <= 2 {
            return true
        }
        
        var helper = Array(repeating: 0, count: nums.count-1)
        // print(helper)
        
        for i in 1..<nums.count {
            // print("Checking i=\(i)")
            if nums[i] < nums[i-1] {
                helper[i-1] = 1
            }
        }
        
        print(helper)
        var sum = helper.reduce(0, +)
        if sum > 1 {
            return false
        }
        
        if sum == 0 {
            return true
        }
        
        let idx = helper.firstIndex(of: 1)!
        if idx == 0 || idx == helper.count-1 {
            return true
        }
        
        let numIdx = idx+1
        return nums[numIdx-1] <= nums[numIdx+1] || nums[idx-1] <= nums[idx+1]
        
        // return  == 1
    }
}
