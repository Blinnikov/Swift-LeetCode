class Solution {
    func minimumLength(_ s: String) -> Int {
        let chars = Array(s)

        var lo = 0
        var hi = chars.count - 1

        while lo < hi, chars[lo] == chars[hi] {
            let ch = chars[lo]

            while lo <= hi, ch == chars[lo] {
                lo += 1
            }

            while lo <= hi, ch == chars[hi] {
                hi -= 1
            }
        }

        return hi - lo + 1
    }
}
