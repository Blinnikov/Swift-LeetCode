
class WordDictionary {
    private let aCode = 97
    private var trie = Node()
    private var cache = [String: Bool]()
    
    class Node {
        var terminal = false
        var children: [Node?] = Array(repeating: nil, count: 26)
    }

    init() { }
    
    func addWord(_ word: String) {
        var curr = trie
        for ch in Array(word) {
            let idx = Int(ch.asciiValue!) - aCode
            if curr.children[idx] == nil {
                curr.children[idx] = Node()
            }
            
            curr = curr.children[idx]!
        }
        curr.terminal = true
        cache = [:]
    }
    
    func search(_ word: String) -> Bool {
        if let found = cache[word] {
            return found
        }

        let result = dfs(Array(word), 0, trie)
        cache[word] = result
        return result
    }
    
    private func dfs(_ word: [Character], _ idx: Int, _ node: Node) -> Bool {
        if idx == word.count {
            return node.terminal
        }
        
        let ch = word[idx]
        
        if ch == "." {
            for n in 0..<26 {
                if node.children[n] != nil && dfs(word, idx+1, node.children[n]!) {
                    return true
                }
            }
            return false
        } else {
            let chIdx = Int(ch.asciiValue!) - aCode
            if node.children[chIdx] == nil {
                return false
            }
            return dfs(word, idx+1, node.children[chIdx]!)
        }
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
