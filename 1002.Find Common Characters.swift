class Solution {
    let a = Character("a").asciiValue!

    func commonChars(_ words: [String]) -> [String] {
        var counts = Array(repeating: Int.max, count: 26)

        for w in words {
            let chars = Array(w)
            var charsCount = Array(repeating: 0, count: 26)

            for ch in chars {
                let idx = Int(ch.asciiValue! - a)
                charsCount[idx] += 1
            }

            for i in 0..<26 {
                counts[i] = min(counts[i], charsCount[i])
            }
        }

        var res = [String]()

        for i in 0..<26 {
            while counts[i] > 0 {
                let ch = UnicodeScalar(Int(a) + i)!
                res.append("\(ch)")
                counts[i] -= 1
            }
        }

        return res
    }
}
