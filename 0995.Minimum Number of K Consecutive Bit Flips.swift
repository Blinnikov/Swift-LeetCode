class Solution {
    func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
        var flips = Array(repeating: 0, count: nums.count)
        var flipped = 0
        var res = 0

        for i in 0..<nums.count {
            if i >= k {
                flipped ^= flips[i - k]
            }

            if nums[i] == flipped {
                if i + k > nums.count {
                    return -1
                }

                flips[i] = 1
                flipped ^= 1
                
                res += 1
            }
        }


        return res
    }
}
