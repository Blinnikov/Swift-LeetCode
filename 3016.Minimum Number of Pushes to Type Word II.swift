class Solution {
    private let a = Int(Character("a").asciiValue!)

    func minimumPushes(_ word: String) -> Int {
        var chars = Array(word)
        var freq = Array(repeating: 0, count: 26)

        for ch in chars {
            freq[charToInt(ch)] += 1
        }

        freq.sort { $0 > $1 }

        var res = 0

        for i in 0..<26 {
            if freq[i] == 0 {
                break
            }

            res += freq[i] * (i / 8 + 1)
        }

        return res
    }

    private func charToInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue!) - a
    }
}
