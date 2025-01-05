class Solution {
    func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
        let chars = Array(s)
        var diffs = Array(repeating: 0, count: chars.count)

        for shift in shifts {
            let from = shift[0]
            let to = shift[1]

            if shift[2] == 0 {
                diffs[from] -= 1

                if to < chars.count - 1 {
                    diffs[to + 1] += 1
                }
            } else {
                diffs[from] += 1

                if to < chars.count - 1 {
                    diffs[to + 1] -= 1
                }
            }
        }

        var res = Array(repeating: Character(" "), count: chars.count)
        var count = 0

        let a = charToInt(Character("a"))

        for i in 0..<chars.count {
            count = (count + diffs[i]) % 26

            if count < 0 {
                count += 26
            }

            let val = a + ((charToInt(chars[i]) - a + count) % 26)

            res[i] = Character(UnicodeScalar(val)!)
        }

        return String(res)
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue!)
    }
}
