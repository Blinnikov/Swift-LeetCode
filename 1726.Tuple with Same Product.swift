class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        var res = 0

        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                let prod = nums[i] * nums[j]
                map[prod, default: 0] += 1
            }
        }

        for k in map.keys {
            let val = map[k]!

            res += 4 * ((val - 1) * val)
        }

        return res
    }
}
