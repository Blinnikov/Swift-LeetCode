class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var short: [Int]
        var long: [Int]
        if nums1.count <= nums2.count {
            short = nums1
            long = nums2
        } else {
            short = nums2
            long = nums1
        }
        
        var lo = 0
        var hi = short.count
        var totalCount = short.count + long.count
        
        while lo <= hi {
            var midShort = (lo + hi) / 2
            var midLong = (totalCount + 1) / 2 - midShort
            
            // printArrays(short, midShort, long, midLong)
            
            let leftShort = midShort == 0 ? Int.min : short[midShort - 1]
            let rightShort = midShort == short.count ? Int.max : short[midShort]
            let leftLong = midLong == 0 ? Int.min : long[midLong - 1]
            let rightLong = midLong == long.count ? Int.max : long[midLong]
            
            // print("Short (\(leftShort), \(rightShort)), Long (\(leftLong), \(rightLong))")
            
            if leftShort <= rightLong && leftLong <= rightShort {
                // both arrays are separated properly
                if totalCount % 2 == 0 {
                    // two elements for median
                    let left = max(leftShort, leftLong)
                    let right = min(rightShort, rightLong)
                    return Double(left + right) / 2
                } else {
                    // only left element
                    return Double(max(leftShort, leftLong))
                }
            }
            
            if leftShort > rightLong {
                hi = midShort - 1
            } else {
                lo = midShort + 1
            }
        }
        
        return 0
    }
    
    private func printArrays(_ nums1: [Int], _ mid1: Int, _ nums2: [Int], _ mid2: Int) {
        var str1 = ""
        for i in 0..<nums1.count {
            var el = i != mid1-1 ? " \(nums1[i])," : " \(nums1[i])|    |"
            str1 += el
        }
        str1 = String(str1.dropLast())
        print(str1)
        
        var str2 = ""
        for i in 0..<nums2.count {
            var el = i != mid2-1 ? " \(nums2[i])," : "\(nums2[i])|    |"
            str2 += el
        }
        str2 = String(str2.dropLast())
        print(str2)
    }
    
    private func solutionFirstAttempt(_ nums1: [Int], _ nums2: [Int]) -> Double {
                // Base cases
        if nums1.count == 0 {
            return getMedianForArray(nums2)
        }
        
        if nums2.count == 0 {
            return getMedianForArray(nums1)
        }
        
        let e1 = nums1.count - 1
        let e2 = nums2.count - 1
        let s1 = 0
        let s2 = 0
        // All elements in nums1 is less than elements in nums2
        // [merged] = [...[nums1], ...[nums2]]
        if nums1[e1] <= nums2[s2] {
            let median = calculateMedian(nums1, s1, e1, nums2, s2, e2)
            // print("median for \(nums1) and \(nums2) is \(median)")
            return median
        }
        
        // All elements in nums2 is less than elements in nums1
        // [merged] = [...[nums2], ...[nums1]]
        if nums2[e2] <= nums1[s1] {
            let median = calculateMedian(nums2, s2, e2, nums1, s1, e1)
            // print("median for \(nums1) and \(nums2) is \(median)")
            return median
        }
        
        return findMedianRecursively(nums1, s1, e1, nums2, s2, e2)
        // var merged = Array(repeating: 0, count: nums1.count + nums2.count)
        
        // Merge arrays
        // ...
        
        // Calculate median
//         var median: Double
//         if (merged.count % 2 == 0) {
//             print("even")
//             median = Double(merged[merged.count/2] + merged[merged.count/2 - 1]) / 2.0
//             print("median is \(median)")
//         } else {
//             print("odd")
//             median = Double(merged[merged.count/2])
//             print("median is \(median)")
//         }
        
//         return median
    }
    
    private func findMedianRecursively(
        _ nums1: [Int], _ s1: Int, _ e1: Int,
        _ nums2: [Int], _ s2: Int, _ e2: Int
    ) -> Double {
        let m1 = getMedianForArray(nums1, s1, e1)
        let m2 = getMedianForArray(nums2, s2, e2)
        
        print("m1=\(m1)(\(s1),\(e1)), m2=\(m2)(\(s2),\(e2))")
        
        if m1 == m2 {
            return m1
        }
        
        if (e1 == s1) && (e2 == s2) {
            return Double(nums1[e1] + nums2[e2]) / 2
        }
        
        if m1 > m2 {
            return findMedianRecursively(nums1, 0, s1 + (e1-s1)/2, nums2, s2 + (e2-s2)/2 + 1, e2);
        } else {
            return findMedianRecursively(nums1, s1 + (e1-s1)/2 + 1, e1, nums2, s2, s2 + (e2-s2)/2);
        }
        
        // Elements in both arrays are interleaved
        // Divide and conquer
        return -1
    }
    
    private func getMedianIndices(_ s1: Int, _ e1: Int, _ s2: Int, _ e2: Int) 
    -> (
        hasTwoIndices: Bool,
        firstIndex: Int,
        isFirstIndexInFirstArray: Bool,
        secondIndex: Int,
        isSecondIndexInFirstArray: Bool
    ) 
    {
        let c1 = e1 - s1 + 1    // first array length - count1
        let c2 = e2 - s2 + 1    // second array length - count2
        let cN = c1 + c2        // merged array length
        
        if cN % 2 == 0 {
            // two indices (true, *, *, *, *)
            let m21 = cN / 2
            let m22 = cN / 2 - 1
            var firstIndex = m21 // first index in firstArray (true, *, true, *, *)
            var isFirstIndexInFirstArray = true
            var secondIndex = m22 // second index in firstArray (true, *, *, *, true)
            var isSecondIndexInFirstArray = true
            
            if firstIndex >= c1 {
                // first index in secondArray (true, *, false, *, *)
                isFirstIndexInFirstArray = false
                firstIndex = firstIndex - c1
            }
            
            if secondIndex >= c2 {
                // second index in secondArray (true, *, *, *, false)
                isSecondIndexInFirstArray = false
                secondIndex = secondIndex - c2
            }
            
            return (
                hasTwoIndices: true, 
                firstIndex: firstIndex,
                isFirstIndexInFirstArray: isFirstIndexInFirstArray,
                secondIndex: secondIndex,
                isSecondIndexInFirstArray: isSecondIndexInFirstArray
            )
        } else {
            // only one index (false, *, *, *, *)
            let m1 = cN / 2
            var firstIndex = m1
            var isFirstIndexInFirstArray = true
            
            if firstIndex >= c1 {
                isFirstIndexInFirstArray = false
                firstIndex = firstIndex - c1
            }
            
            return (
                hasTwoIndices: false, 
                firstIndex: firstIndex,
                isFirstIndexInFirstArray: isFirstIndexInFirstArray,
                secondIndex: -1,
                isSecondIndexInFirstArray: false
            )
        }
    }
    
    private func calculateMedian(
        _ nums1: [Int], _ s1: Int, _ e1: Int,
        _ nums2: [Int], _ s2: Int, _ e2: Int
    ) -> Double {
        let indices = getMedianIndices(s1, e1, s2, e2)
        if indices.hasTwoIndices {
            // two values
            var first = indices.isFirstIndexInFirstArray ? nums1[indices.firstIndex] : nums2[indices.firstIndex]
            var second = indices.isSecondIndexInFirstArray ? nums1[indices.secondIndex] : nums2[indices.secondIndex]
            return Double(first + second) / 2.0
        } else {
            // one value
            if indices.isFirstIndexInFirstArray {
                return Double(nums1[indices.firstIndex])
            } else {
                return Double(nums2[indices.firstIndex])
            }
        }
    }
    
    private func getMedianForArray(_ arr: [Int], _ s: Int = 0, _ e: Int = -1) -> Double {
        var e = e == -1 ? arr.count - 1 : e
        let count = e - s + 1
        
        // print("[getMedianForArray] e=\(e), count=\(count)")
        
        if count == 1 {
            return Double(arr[s])
        }
        
        if count % 2 == 0 {
            return Double(arr[s + count/2] + arr[s + count/2 - 1]) / 2.0
        } else {
            return Double(arr[count/2])
        }
    }
}
