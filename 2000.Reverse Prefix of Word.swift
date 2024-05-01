class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var chars = Array(word)
        
        var res = [Character]()
        res.reserveCapacity(chars.count)

        var i = 0
        
        // before ch
        while i < chars.count, chars[i] != ch {
            res.insert(chars[i], at: 0)
            i += 1
        }

        // ch
        if i < chars.count {
            res.insert(ch, at: 0)
            i += 1
        } else {
            return String(res.reversed())
        }

        while i < chars.count {
            res.append(chars[i])
            i += 1
        }

        return String(res)
    }
}
