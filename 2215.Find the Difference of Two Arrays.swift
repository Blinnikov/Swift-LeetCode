
class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
//         let first = Array(Set(nums1).subtracting(Set(nums2)))
//         let second = Array(Set(nums2).subtracting(Set(nums1)))       
//         return [first, second]
        
        var map = [Int:Int]()
        var r1 = [Int]()
        var r2 = [Int]()
        
        for n in nums1 {
            map[n] = 1
        }
        
        for n in nums2 {
            map[n] = (map[n] ?? 0) | 2
        }
        
        for (index, element) in map.enumerated() {
            if element.value == 1 {
                r1.append(element.key)
            }
            if element.value == 2 {
                r2.append(element.key)
            }
        }
        
        return [r1, r2]
    }
}
