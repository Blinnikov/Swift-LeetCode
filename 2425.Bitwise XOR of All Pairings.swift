class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var map = [Int:Int]()

        for n in nums1 {
            map[n, default: 0] += nums2.count
        }

        for n in nums2 {
            map[n, default: 0] += nums1.count
        }

        var res = 0

        for kv in map {
            if kv.value % 2 == 1 {
                res ^= kv.key
            }
        }

        return res
    }
}
