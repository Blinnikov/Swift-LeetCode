class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int : Int]()
        for i in 0..<nums.count {
            if let firstIndex = map[nums[i]] {
                if nums[i] + nums[i] == target {
                    return [firstIndex, i]
                }
            } else {
                map[nums[i]] = i
            }
        }
        
        for i in 0..<nums.count {
            let remainder = target - nums[i]
            if let remainderIndex = map[remainder], remainderIndex != i {                
                return [remainderIndex, i]
            }
        }
        
        return []
    }
}
