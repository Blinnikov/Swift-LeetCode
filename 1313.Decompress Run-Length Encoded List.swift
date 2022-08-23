class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for i in 0..<nums.count/2 {
            result += Array(repeating: nums[2*i+1], count: nums[2*i])
        }
        
        return result
    }
}
