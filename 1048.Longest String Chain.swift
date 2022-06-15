class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var words = words.sorted { $0.count < $1.count }
        
        var map = [String:Int]()
        var result = 1
        
        for word in words {
            if map[word] == nil {
                map[word] = 1
            }
            
            for i in 0..<word.count {
                var wordCopy = word                
                wordCopy.remove(at: word.index(word.startIndex, offsetBy: i))
                if let count = map[wordCopy] {
                    map[word] = max(map[word]!, count + 1)
                    result = max(result, map[word]!)
                }
            }
        }
        
        return result
    }
}
