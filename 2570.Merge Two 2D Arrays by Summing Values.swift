class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var map = [Int:Int]()

        for n in nums1 {
            map[n[0]] = n[1]
        }

        for n in nums2 {
            map[n[0], default: 0] += n[1]
        }

        var res = [[Int]]()

        for (k, v) in map {
            res.append([k, v])
        }

        return res.sorted { $0[0] < $1[0] }
    }
}
