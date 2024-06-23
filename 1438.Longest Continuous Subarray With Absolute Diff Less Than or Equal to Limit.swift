class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var res = 1
        var lo = 0

        var _min = [Int]()
        var _max = [Int]()

        for hi in 0..<nums.count {
            while !_max.isEmpty,  _max.last! < nums[hi] {
                _max.removeLast()
            }

            _max.append(nums[hi])

            while !_min.isEmpty, _min.last! > nums[hi] {
                _min.removeLast()
            }

            _min.append(nums[hi])

            while _max.first! - _min.first! > limit {
                if _max.first! == nums[lo] {
                    _max.remove(at: 0)
                }

                if _min.first! == nums[lo] {
                    _min.remove(at: 0)
                }

                lo += 1
            }

            res = max(res, hi - lo + 1)
        }

        return res
    }
}
