class Solution {
    private let mod = 1000000007

    func countNicePairs(_ nums: [Int]) -> Int {
        var counts = [Int:Int]()

        for n in nums {
            counts[n - reverse(n), default: 0] += 1
        }

        var res = 0

        for (k, v) in counts {
            let perm = (v * (v - 1)) / 2
            
            res = (res + perm) % mod
        }
        
        return res
    }

    private func reverse(_ num: Int) -> Int {
        var n = num
        var res = 0

        while n > 0 {
            res = res * 10 + n % 10
            n /= 10
        }

        return res
    }
}
