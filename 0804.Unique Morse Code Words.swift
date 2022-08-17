class Solution {
    
    private let morse : [Character:String] = [
        "a" : ".-",
        "b" : "-...",
        "c" : "-.-.",
        "d" : "-..",
        "e" : ".",
        "f" : "..-.",
        "g" : "--.",
        "h" : "....",
        "i" : "..",
        "j" : ".---",
        "k" : "-.-",
        "l" : ".-..",
        "m" : "--",
        "n" : "-.",
        "o" : "---",
        "p" : ".--.",
        "q" : "--.-",
        "r" : ".-.",
        "s" : "...",
        "t" : "-",
        "u" : "..-",
        "v" : "...-",
        "w" : ".--",
        "x" : "-..-",
        "y" : "-.--",
        "z" : "--.."
    ]
    
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var map = [String:Int]()
        
        for word in words {
            map[wordToMorse(word), default: 0] += 1
        }
        
        return map.keys.count
    }
    
    private func wordToMorse(_ word: String) -> String {
        Array(word).reduce("", { $0 + morse[$1]! })
    }
}
