class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var b0 = 0
        var b1 = 0

        for num in nums {
            b0 = (b0 ^ num) & (~b1)
            b1 = (b1 ^ num) & (~b0)
        }

        return b0

        var res = 0

        for i in 0..<32 {
            var sum = 0

            for num in nums {
                if (num >> i) & 1 == 1 {
                    sum += 1
                    sum %= 3
                }
            }

            if sum != 0 {
                res |= (sum << i)
            }
            
        }

        return res
    }
}
