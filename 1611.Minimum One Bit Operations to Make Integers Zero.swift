class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var n = n
        var sign = 1
        var res = 0

        while n > 0 {
            res += sign * (n ^ (n - 1))
            sign = -1 * sign
            n &= n - 1
        }

        return abs(res)
    }
}
