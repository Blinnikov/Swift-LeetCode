class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var goodTillIndex = firstIndex(in: nums, from: 0, corresponding: { $0 == 0 && ($1 == nil || $1 != 0) })
        if goodTillIndex == nums.count-1 || goodTillIndex == -1 {
            return
        }
        
        var nonZero = firstIndex(in: nums, from: goodTillIndex, corresponding: { (el, _) in el != 0 })
        if nonZero == -1 {
            return
        }
        
        var zero = firstIndex(in: nums, from: goodTillIndex, corresponding: { (el, _) in el == 0 })
        if zero == -1 {
            return
        }
        
        while nonZero != -1 && zero != -1 && zero != nums.count-1 {
            nums.swapAt(nonZero, zero)
            let searchFromIndex = zero+1
            zero = firstIndex(in: nums, from: searchFromIndex, corresponding: { (el, _) in el == 0 })
            nonZero = firstIndex(in: nums, from: searchFromIndex, corresponding: { (el, _) in el != 0 })
        }
    }
    
    private func firstIndex(in nums: [Int], from index: Int, corresponding condition: (Int,Int?)->Bool) -> Int {
        if index >= nums.count-1 {
            return -1
        }
        for i in index..<nums.count {
            if condition(nums[i], i>0 ? nums[i-1] : nil) {
                return i
            }
        }
        
        return -1
    }
}
