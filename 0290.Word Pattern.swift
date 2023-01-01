class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var chars = Array(pattern)
        var words = s.components(separatedBy: " ")

        // print(chars, words)

        if chars.count != words.count {
            return false
        }

        var map = [Character:String]()
        var reverseMap = [String:Character]()

        for i in 0..<chars.count {
            let ch = chars[i]
            let word = words[i]

            if let exist = map[ch] {
                if exist != word {
                    return false
                }
            } else {
                map[ch] = word
            }

            if let exist = reverseMap[word] {
                if exist != ch {
                    return false
                }
            } else {
                reverseMap[word] = ch
            }
        }

        return true
    }
}
