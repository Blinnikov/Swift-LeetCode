class Solution {
    func isUgly(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        
        var n = n
        for factor in [2, 3, 5] {
            n = divide(n, factor)
        }

        return n == 1
    }

    private func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var dividend = dividend
        while dividend % divisor == 0 {
            dividend /= divisor
        }
        return dividend
    }
}
