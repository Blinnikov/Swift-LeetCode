// TLE 64/65

class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        var cache = [Int:Int]()
        var result = Array(repeating: 0, count: nums.count)
        
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            var count = 0
            
            if let exist = cache[nums[i]] {
                count = exist
                for j in i+1..<nums.count {
                    if nums[j] == nums[i] {
                        break
                    }
                    
                    if nums[j] < nums[i] {
                        count += 1
                    }
                }
            } else {
                for j in i+1..<nums.count {
                    if nums[j] < nums[i] {
                        count += 1
                    }
                }
            }
            
            cache[nums[i]] = count
            result[i] = count
        }
        
        return result
    }
}
