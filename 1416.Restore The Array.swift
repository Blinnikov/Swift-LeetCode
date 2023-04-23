class Solution {
    private var chars = [Character]()
    private var dp = [Int]()
    private var k = -1

    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        chars = Array(s)
        dp = Array(repeating: -1, count: chars.count)
        self.k = k

        return traverse(0)
    }

    private func traverse(_ step: Int) -> Int {
        if step == chars.count {
            return 1
        }

        if chars[step] == "0" {
            return 0
        }

        if dp[step] != -1 {
            return dp[step]
        }

        var res = 0

        var num = 0

        for i in step..<chars.count {
            num = num * 10 + chars[i].wholeNumberValue!
            if num > k {
                break
            }

            res += traverse(i + 1)
            res %= 1000000007
        }

        dp[step] = res
        return res
    }
}
