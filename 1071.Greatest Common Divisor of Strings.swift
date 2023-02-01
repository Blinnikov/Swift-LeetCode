class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        var len = gcd(str1.count, str2.count)
        return String(Array(str1)[0..<len])
    }

    private func gcd(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 0 {
            return dividend
        } else {
            return gcd(divisor, dividend % divisor)
        }
    }
}
