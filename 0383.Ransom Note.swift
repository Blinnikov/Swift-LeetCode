class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var hash = [Character:Int]()
        
        magazine.forEach { char in
            if let count = hash[char] {
                hash[char] = count + 1
            } else {
                hash[char] = 1
            }
        }
        
        for ch in ransomNote {
            guard let count = hash[ch] else {
                return false
            }
            
            if count <= 0 {
                return false
            }
                
            hash[ch] = count - 1
        }
        
        return true
    }
}
