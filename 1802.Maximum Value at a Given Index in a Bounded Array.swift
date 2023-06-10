class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var maxSum = maxSum - n
        var lo = 0
        var hi = maxSum

        while lo < hi {
            let mid = (lo + hi + 1) / 2

            if check(n, index, mid) <= maxSum {
                lo = mid
            } else {
                hi = mid - 1
            }
        }

        return lo + 1
    }

    private func check(_ n: Int, _ idx: Int, _ val: Int) -> Int {
        var maxVal = max(val - idx, 0)

        var res = ((val + maxVal) * (val - maxVal + 1)) / 2
        
        maxVal = max(val - ((n - 1) - idx), 0);
        
        res += (val + maxVal) * (val - maxVal + 1) / 2
        
        return res - val
    }
}
