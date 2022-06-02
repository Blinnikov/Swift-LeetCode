class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // first option
        return Array(Set(nums1).intersection(Set(nums2)))
      
        // second
        var map = [Int:Bool]()
        var result = [Int]()
        result.reserveCapacity(max(nums1.count,nums2.count))
        
        for n in nums1 {
            map[n] = true
        }
        
        for n in nums2 {
            if let exist = map[n], exist {
                result.append(n)
                map[n] = false
            }
        }
        
        return result
    }
}
