class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // return Set(nums).count != nums.count
        
        var map = [Int:Int]()
        for n in nums {
            if let exist = map[n] {
                // map[n] = exist + 1
                return true
            } else {
                map[n] = 0
            }
        }
        
        return false
    }
}
