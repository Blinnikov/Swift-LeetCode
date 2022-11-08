class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var lo = 0, hi = chars.count - 1
        var charRemoved = false

        while lo <= hi {
            if chars[lo] == chars[hi] {
                lo += 1
                hi -= 1
                continue
            }

            if !charRemoved && (chars[lo] == chars[hi - 1] || chars[hi] == chars[lo + 1]) {
                charRemoved = true
                return isValid(chars, lo, hi - 1) || isValid(chars, lo + 1, hi)
            }

            return false
        }

        return true
    }

    private func isValid(_ chars: [Character], _ lo: Int, _ hi: Int) -> Bool {
        var lo = lo, hi = hi
        while lo <= hi {
            if chars[lo] != chars[hi] {
                return false
            }

            lo += 1
            hi -= 1
        }

        return true
    }
}
