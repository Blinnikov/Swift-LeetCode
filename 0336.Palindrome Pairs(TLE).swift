class Solution {
    
    // var arrs = [[Character]]()
    
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var result = Set<[Int]>()
        var map = [String:Int]()
        for i in 0..<words.count {
            map[words[i]] = i
        }
        
        
        // arrs = Array(repeating:[Character](), count: words.count)
        // for i in 0..<words.count {
        //     arrs[i] = Array(words[i])
        // }
        
        if let emptyIdx = map[""] {
            for i in 0..<words.count {
                if isPalindrome(words[i]) {
                    if i == emptyIdx {
                        continue
                    }
                    
                    result.insert([i, emptyIdx])
                    result.insert([emptyIdx, i])
                }
            }
        }
        
        for i in 0..<words.count {
            let reversed = String(words[i].reversed())
            if let reversedIdx = map[reversed], reversedIdx != i {
                result.insert([i, reversedIdx])
            }
        }
        
        for i in 0..<words.count {
            // print(words[i])
            
            if words[i].count < 2 {
                continue
            }
            
            if words[i] != "" {
                for midIdx in 1..<words[i].count {
                
                    if isPalindrome(String(words[i].prefix(midIdx))) {
                        let reversed = String(String(words[i].suffix(words[i].count-midIdx)).reversed())
                        if let reversedIdx = map[reversed], reversedIdx != i {
                            result.insert([reversedIdx, i])
                        }
                    }

                    if isPalindrome(String(words[i].suffix(midIdx))) {
                        let reversed = String(String(words[i].prefix(words[i].count-midIdx)).reversed())
                        if let reversedIdx = map[reversed], reversedIdx != i {
                            result.insert([i, reversedIdx])
                        }
                    }
                }
            }
            
            
        }
        
        return Array(result)
    }
    
    private func isPalindrome(_ word: String) -> Bool {
        let firstHalf = String(word.prefix(word.count / 2))
        let secondHalf = String(word.suffix(word.count / 2))
        
        if firstHalf == String(secondHalf.reversed()) {
            return true
        } else {
            return false
        }
    }
}
