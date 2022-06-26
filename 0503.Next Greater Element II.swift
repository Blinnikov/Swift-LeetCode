class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: -1, count: n)
        var mono = [Int]()
        
        for i in stride(from: nums.count * 2 - 1, through: 0, by: -1) {
            while !mono.isEmpty && mono.last! <= nums[i%n] {
                mono.removeLast()
            }
            result[i%n] = mono.isEmpty ? -1 : mono.last!
            mono.append(nums[i%n])
        }
        
        return result
    }
}
