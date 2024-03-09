class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var map = [Int:Bool]()

        for n in nums1 {
            map[n] = true
        }

        var res = -1

        for n in nums2 {
            if let exist = map[n] {
                if res == -1 {
                    res = n
                } else {
                    res = min(res, n)
                }
            }
        }

        return res
    }
}
