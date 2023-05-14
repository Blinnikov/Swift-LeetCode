
class Solution {
    private var nums: [Int] = [Int]()
    private var dp = [[Int]]()

    func maxScore(_ nums: [Int]) -> Int {
        self.nums = nums
        self.dp = Array(repeating: Array(repeating: 0, count: 1 << nums.count), count: nums.count / 2 + 1)
        
        return dfs(1, 0)
    }

    private func dfs(_ step: Int, _ mask: Int) -> Int {
        if step > nums.count / 2 {
            return 0
        }

        if dp[step][mask] == 0 {
            for j in 0..<nums.count {
                for k in (j+1)..<nums.count {
                    let newMask = (1 << j) + (1 << k)

                    if (mask & newMask) == 0 {
                        let _gcd = step * gcd(nums[j], nums[k])
                        
                        dp[step][mask] = max(
                            dp[step][mask],
                            _gcd  + dfs(step + 1, mask + newMask)
                        )
                    }
                }
            }
        }

        return dp[step][mask]
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        b == 0 ? a : gcd(b, a % b)
    }
}
