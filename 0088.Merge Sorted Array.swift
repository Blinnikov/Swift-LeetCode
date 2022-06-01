class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // print(nums1)
        // print(nums2)
        
        if nums1.count == m {
            return
        }
        
        if m == 0 {
            nums1 = nums2
            return 
        }
        
        for i in stride(from: m-1, through: 0, by: -1) {
            // print("Swaping \(nums1[i])(\(i)) and \(nums1[nums1.count-(m-i)])(\(nums1.count-(m-i)))")
            nums1.swapAt(i, nums1.count-(m-i))
        }
        
        // print(nums1)
        
        var mIdx = nums1.count - m
        var nIdx = 0
        
        for i in 0..<nums1.count {
            if nIdx >= n {
                mIdx += 1
                continue
            }
            if mIdx < nums1.count && nums1[mIdx] < nums2[nIdx] {
                nums1.swapAt(i, mIdx)
                mIdx += 1
            } else {
                nums1[i] = nums2[nIdx]
                nIdx += 1
            }
            // print("Iteration \(i): \(nums1) \(nums2), \tmIdx=\(mIdx), nIdx=\(nIdx)")
        }
        
        // print(nums1)
    }
}
