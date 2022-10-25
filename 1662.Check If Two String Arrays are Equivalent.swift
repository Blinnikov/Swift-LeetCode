class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        word1.reduce("", +) == word2.reduce("", +)
    }
}
