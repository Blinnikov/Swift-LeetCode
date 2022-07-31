
class NumArray {
    
    private var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func update(_ index: Int, _ val: Int) {
        nums[index] = val
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var res = 0
        
        for i in left...right {
            res += nums[i]
        }
        
        return res
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */
