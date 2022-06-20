class WordDictionary {
    private let aCode = 97
    private var term = [Character]()
    private var cache = [String: Bool]()
    
    class Node {
        var terminal = false
        var children: [Node?] = Array(repeating: nil, count: 26)
    }
    
    private var trie = Node()

    init() {
    }
    
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
        
        term = Array(word)
        defer {
            term = []
        }
        // print("Searching for \(word)")
        let result = dfs(0, trie)
        cache[word] = result
        return result
    }
    
    private func dfs(_ idx: Int, _ node: Node) -> Bool {
        if idx == term.count {
            return node.terminal
        }
        
        let ch = term[idx]
        
            if ch == "." {
                for n in 0..<26 {
                    if node.children[n] != nil && dfs(idx+1, node.children[n]!) {
                        return true
                    }
                }
                return false
            } else {
                let chIdx = Int(ch.asciiValue!) - aCode
                if node.children[chIdx] == nil {
                    return false
                }
                return dfs(idx+1, node.children[chIdx]!)
            }
    }
}
