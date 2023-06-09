class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var chars = Array(letters)
        
        if let idx = chars.firstIndex { $0 > target  } {
            return chars[idx]
        }

        return chars[0]
    }
}
