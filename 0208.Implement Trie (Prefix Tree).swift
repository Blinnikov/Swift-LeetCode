class Node {
    var children = [Character:Node]()
    var terminal = false 
}

class Trie {
    private let root: Node
    
    init() {
        self.root = Node()
    }
    
    func insert(_ word: String) {
        var cur = root
        for ch in Array(word) {
            if cur.children[ch] == nil {
                cur.children[ch] = Node()
            }
            cur = cur.children[ch]!
        }
        cur.terminal = true
    }
    
    func search(_ word: String) -> Bool {
        var cur = root
        for ch in Array(word) {
            if cur.children[ch] == nil {
                return false
            }
            cur = cur.children[ch]!
        }
        
        return cur.terminal
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for ch in Array(prefix) {
            if cur.children[ch] == nil {
                return false
            }
            cur = cur.children[ch]!
        }
        
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
