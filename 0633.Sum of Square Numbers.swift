class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var a = 0

        while a * a <= c {
            let b = sqrt(Double(c - a * a))

            if floor(b) == b {
                return true
            }

            a += 1
        }

        return false
    }
}
