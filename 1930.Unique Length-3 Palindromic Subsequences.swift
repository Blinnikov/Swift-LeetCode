class Solution {
    private let a = Character("a").wholeNumberValue

    func countPalindromicSubsequence(_ s: String) -> Int {
        var chars = Array(s)
        var firstOccurence = [Character:Int]()
        var lastOccurence = [Character:Int]()

        for i in 0..<chars.count {
            if firstOccurence[chars[i]] == nil {
                firstOccurence[chars[i]] = i
            }

            lastOccurence[chars[i]] = i
        }

        var res = 0

        for i in 0..<chars.count {
            let lo = firstOccurence[chars[i]]!

            if lo < i {
                continue
            }

            let hi = lastOccurence[chars[i]]!

            if lo == hi || lo == chars.count - 1 {
                continue
            }

            res += Set(chars[(lo + 1)..<hi]).count
        }

        return res
    }
}
