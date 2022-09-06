
class NumArray {
    
    private var psa: [Int]

    init(_ nums: [Int]) {
        psa = Array(repeating: 0, count: nums.count)
        psa[0] = nums[0]
        for i in 1..<nums.count {
            psa[i] = psa[i-1] + nums[i]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        let leftVal = left > 0 ? psa[left-1] : 0
        return psa[right] - leftVal
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
