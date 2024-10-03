class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        var sum = 0

        for n in nums {
            sum = (sum + n) % p
        }
        
        let target = sum % p

        if target == 0 {
            return 0
        }

        var map = [Int: Int]()
        map[0] = -1

        var s = 0
        var l = nums.count

        for i in 0..<nums.count {
            s = (s + nums[i]) % p

            let toRemove = (s - target + p) % p

            if let rem = map[toRemove] {
                l = min(l, i - rem)
            }

            map[s] = i
        }

        return l == nums.count ? -1 : l
    }
}
