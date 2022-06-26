class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int:Int]() // value:index
        var greaters = Array(repeating: -1, count: nums2.count)
        var result = Array(repeating: -1, count: nums1.count)
        var mono = [Int]()
        
        for i in stride(from: nums2.count-1, through: 0, by: -1) {
            map[nums2[i]] = i
            while !mono.isEmpty && mono.last! <= nums2[i] {
                mono.removeLast()
            }
            greaters[i] = mono.isEmpty ? -1 : mono.last!
            mono.append(nums2[i])
        }
        
        for i in 0..<nums1.count {
            let idx = map[nums1[i]]!
            result[i] = greaters[idx]
        }
        
        return result
    }
}
