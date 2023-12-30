class Solution {
    func makeEqual(_ words: [String]) -> Bool {
        var map = [Character:Int]()

        for word in words {
            for ch in Array(word) {
                map[ch, default: 0] += 1
            }
        }

        for (k, v) in map {
            if v % words.count != 0 {
                return false
            }
        }

        return true
    }
}
