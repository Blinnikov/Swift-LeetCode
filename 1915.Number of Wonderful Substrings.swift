class Solution {
    private let a = Character("a").asciiValue!

    func wonderfulSubstrings(_ word: String) -> Int {
        var count = Array(repeating: 0, count: 1024) // 2 ^ 10
        count[0] = 1
        
        var currentMask = 0
        var res = 0

        var chars = Array(word)
        
        for ch in chars {
            let n = charToInt(ch)
            let maskForN = 1 << n

            currentMask ^= maskForN

            res += count[currentMask]

            for i in 0...9 {
                let maskForI = 1 << i
                let currentMaskWithI = currentMask ^ maskForI
                
                res += count[currentMaskWithI]
            }

            count[currentMask] += 1
        }

        return res
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue! - a)
    }
}
