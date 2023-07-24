class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var n = n
        var x = x

        if n == 0 {
            return 1
        }

        if n < 0 {
            n = -n
            x = 1.0 / x
        }

        if n & 1 == 0 {
            return myPow(x * x, n / 2)
        }

        return x * myPow(x * x, n / 2)
    }
}
