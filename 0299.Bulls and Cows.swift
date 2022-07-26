class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var secretChars = Array(secret)
        var map = [Character:Int]()
        
        for ch in secretChars {
            map[ch, default: 0] += 1
        }
        
        var bulls = 0, cows = 0
        var guessChars = Array(guess)
        
        for i in 0..<guess.count {
            if secretChars[i] == guessChars[i] {
                bulls += 1
                map[guessChars[i], default: 0] -= 1
            }
        }
        
        for i in 0..<guess.count {
            if secretChars[i] != guessChars[i], let exist = map[guessChars[i]], exist != 0 {
                cows += 1
                map[guessChars[i]] = exist - 1
            }
        }
        
        return "\(bulls)A\(cows)B"
    }
}
