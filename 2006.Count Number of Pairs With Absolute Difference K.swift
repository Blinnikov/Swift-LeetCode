class Solution {
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i]-nums[j] == k || nums[j]-nums[i] == k {
                    result += 1
                }
            }
        }
        
        return result
    }
}
