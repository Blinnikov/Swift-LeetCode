class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [Int:[Int]]()
        
        for i in 0..<nums.count {
            if let exist = map[nums[i]] {
                if i - exist.last! <= k {
                    return true
                } else {
                    map[nums[i]]!.append(i)
                }
            } else {
                map[nums[i], default: [Int]()].append(i)
            }
        }
        
        return false
    }
}
