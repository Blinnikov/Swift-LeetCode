class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        let chars = Array(word)

        return chars.allSatisfy { $0.isUppercase } 
            || chars.allSatisfy { $0.isLowercase } 
            || chars.lastIndex { $0.isUppercase } == 0
    }
}
