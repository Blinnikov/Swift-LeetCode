class Solution {
    private let a = Character("a").asciiValue!

    private var cache = [[Int]]()
    private var charToIdxMap = Array(repeating: [Int](), count: 26)
    private var keyChars = [Character]()
    private var ringChars = [Character]()

    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        ringChars = Array(ring)
        keyChars = Array(key)

        cache = Array(repeating:Array(repeating: 0, count: ringChars.count), count: keyChars.count)

        for i in 0..<ringChars.count {
            let ch = ringChars[i]
            let idx = charToInt(ch)
            charToIdxMap[idx].append(i)
        }

        return solve(0, 0)
    }

    func solve(_ charIdx: Int, _ keyIdx: Int) -> Int {
        if keyIdx == keyChars.count {
            return 0
        }

        if cache[keyIdx][charIdx] > 0 {
            return cache[keyIdx][charIdx] - 1
        }

        var res = Int.max

        let keyChar = keyChars[keyIdx]
        let keyCharIdx = charToInt(keyChar)
        for i in charToIdxMap[keyCharIdx] {
            let curr = 
                i >= charIdx 
                ? min(i - charIdx, charIdx + ringChars.count - i)
                : min(charIdx - i, ringChars.count - charIdx + i)

            res = min(res, curr + solve(i, keyIdx + 1))
        }

        cache[keyIdx][charIdx] = res + 2

        return cache[keyIdx][charIdx] - 1

    }

    func charToInt(_ char: Character) -> Int {
        return Int(char.asciiValue! - a)
    }
}
