class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        // firstAttempt(beginWord, endWord, wordList)
        
        var result = [[String]]()
        var dict = Set<String>(wordList)
        
        if !dict.contains(endWord) {
            return result
        }
        
        var queue: [[String]] = [[beginWord]]
        var found = false
        var tempSeen = Set<String>()
        var visited = Set<String>()
        
        while queue.isEmpty == false && found == false {
            let temp = queue
            queue.removeAll()
            visited.formUnion(tempSeen)
            tempSeen.removeAll()
            
            for path in temp {
                let lastWord = Array(path.last!)
                if path.last! == endWord {
                    found = true
                    result.append(path)
                }

                for i in 0..<lastWord.endIndex {
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        let newWord = String(lastWord[0..<i] + [char] + lastWord[i+1..<lastWord.endIndex])
                        if dict.contains(newWord) && visited.contains(newWord) == false {
                            tempSeen.insert(newWord)
                            queue.append(path+[newWord])
                        }
                    }
                }
            }
        }
        return result
    }
    
    private func firstAttempt(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var result = [[String]]()
        var dict = Set<String>(wordList)
        var map = [String:[String]]()
        
        if !dict.contains(endWord) {
            return result
        }
        
        var startSet = Set<String>()
        startSet.insert(beginWord)
        
        var endSet = Set<String>()
        endSet.insert(endWord)
        
        bfs(startSet, endSet, dict, &map, false)
        
        var list = [String]()
        list.append(beginWord)
        dfs(&result, &list, beginWord, endWord, &map)
        
        return result
    }
    
    private func bfs(_ startSet: Set<String>, _ endSet: Set<String>, _ dict: Set<String>, _ map: inout [String:[String]], _ reversed: Bool) {
        guard startSet.count != 0 else {
            return
        }
        
        if startSet.count > endSet.count {
            bfs(endSet, startSet, dict, &map, !reversed)
            return
        }
        
        var finished = false
        var temp = Set<String>();
        var dict = dict.subtracting(startSet)
        
        for s in startSet {
            var chars = Array(s)
            
            for i in 0..<chars.count {
                let orig = chars[i]
                
                for ch in "abcdefghijklmnopqrstvuwxyz" {
                    chars[i] = ch
                    let word = String(chars)
                    // print(word)
                    
                    if dict.contains(word) {
                        if endSet.contains(word) {
                            finished = true
                        } else {
                            temp.insert(word)
                        }
                        
                        let key = reversed ? word : s
                        let val = reversed ? s : word 
                        
                        map[key, default: [String]()].append(val)
                    }
                }
                
                chars[i] = orig
            }
        }
        
        if !finished  {
            bfs(temp, endSet, dict, &map, reversed)
        }
    }
    
    private func dfs(_ result: inout [[String]], _ list: inout [String], _ beginWord: String, _ endWord: String, _ map: inout [String:[String]]) {
        if beginWord == endWord {
            result.append(list)
            return
        }
        
        if map[beginWord] == nil {
            return 
        }
        
        for word in map[beginWord]! {
            list.append(word)
            dfs(&result, &list, word, endWord, &map)
            list.removeLast()
        }
    }
}
