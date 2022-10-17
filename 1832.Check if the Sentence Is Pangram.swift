class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        let chars = Array(sentence)
        if chars.count < 26 {
            return false
        }
        
        var map = [Character:Bool]()
        for ch in chars {
            map[ch] = true
        }
        
        return map.keys.count == 26
    }
}
