class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let n = Int(n)!

        let prev = prevPalindrome(n)
        let next = nextPalindrome(n)

        return abs(prev - n) <= abs(next - n) ? "\(prev)" : "\(next)"
    }

    private func toPalindrome(_ n: Int) -> Int {
        var chars = Array("\(n)")

        var lo = (chars.count - 1) / 2
        var hi = chars.count / 2

        while lo >= 0 {
            chars[hi] = chars[lo]
            
            hi += 1
            lo -= 1
        }

        return Int(String(chars))!
    }

    private func prevPalindrome(_ n: Int) -> Int {
        var lo = 0
        var hi = n

        var res = Int.min

        while lo <= hi {
            let mid = lo + (hi - lo) / 2 
            let palindrome = toPalindrome(mid)

            if palindrome < n {
                res = palindrome
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }

        return res
    }

    private func nextPalindrome(_ n: Int) -> Int {
        var lo = n
        var hi = Int(1e18)

        var res = Int.min

        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            let palindrome = toPalindrome(mid)

            if palindrome > n {
                res = palindrome
                hi = mid - 1
            } else {
                lo = mid + 1
            }

        }

        return res
    }
}
