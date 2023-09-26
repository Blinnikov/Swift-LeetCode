class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var chars = Array(s)
        var charToIdxMap = [Character:Int]()
        var charUsed = [Character:Bool]()

        for i in 0..<chars.count {
            let ch = chars[i]
            charToIdxMap[ch] = i
        }

        var stack = [Character]()

        for i in 0..<s.count {
            let ch = chars[i]

            if charUsed[ch, default: false] {
                continue
            }

            while !stack.isEmpty, stack.last! > ch, i < charToIdxMap[stack.last!]! {
                charUsed[stack.last!] = false
                stack.removeLast()
            }

            stack.append(ch)
            charUsed[ch] = true
        }

        return String(stack)
    }
}
