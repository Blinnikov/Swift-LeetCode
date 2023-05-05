class Solution {
    private let vowels: Set<Character> = ["a", "e", "i", "o", "u"]

    func maxVowels(_ s: String, _ k: Int) -> Int {
        var letters = Array(s)
        var res = 0
        var subRes = 0
        var lo = 0
        var hi = 0

        while hi <= letters.count - 1 {
            while hi - lo + 1 <= k {
                if isVowel(letters[hi]) {
                    subRes += 1
                }
                hi += 1
            }

            res = max(res, subRes)

            if isVowel(letters[lo]) {
                subRes -= 1
            }
            lo += 1
        }

        return res
    }

    private func isVowel(_ ch: Character) -> Bool {
        vowels.contains(ch)
    }
}
