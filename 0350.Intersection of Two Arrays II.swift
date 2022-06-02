class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int:Int]()
        var result = [Int]()
        result.reserveCapacity(max(nums1.count, nums2.count))
        
        for n1 in nums1 {
            map[n1] = (map[n1] ?? 0) + 1 
        }
        
        for n2 in nums2 {
            if let n = map[n2], n > 0 {
                result.append(n2)
                map[n2] = n-1
            }
        }
        
        return result
    }
}
