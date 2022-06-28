class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var leftSum = Array(repeating: 0, count: nums.count+1)
        var rightSum = Array(repeating: 0, count: nums.count+1)
        
        for i in 0..<nums.count {
            leftSum[i+1] = leftSum[i] + nums[i]
            rightSum[nums.count-i-1] = rightSum[nums.count-i] + nums[nums.count-i-1]
        }
        
        for i in 0..<nums.count {
            if leftSum[i] == rightSum[i+1] {
                return i
            }
        }
        
        return -1
    }
}
