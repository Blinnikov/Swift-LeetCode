class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var trie = Trie()
        for pr in products {
            trie.insert(pr)
        }
        var result = [[String]]()
        var prefix = ""
        for ch in Array(searchWord) {
            prefix = "\(prefix)\(ch)"
            result.append(trie.words(startingWith: prefix))
        }
        
        return result
    }
}

class Trie {
    var root: Node
    var curr: Node
    var buffer: [String]
    
    init() {
        self.root = Node()
        curr = root
        self.buffer = [String]()
    }
    
    func dfs(_ curr: Node, _ word: String) {
        if buffer.count == 3 {
            return
        }
        if curr.terminal {
            buffer.append(word)
        }
        
        for ch in curr.children.keys.sorted() {
            dfs(curr.children[ch]!, "\(word)\(ch)")
        }
    }
    
    func words(startingWith prefix: String) -> [String] {
        curr = root
        buffer = [String]()
        
        for ch in Array(prefix) {
            if curr.children[ch] == nil {
                return buffer
            }
            curr = curr.children[ch]!
        }
        
        dfs(curr, prefix)
        return buffer
    }
    
    func insert(_ s: String) {
        curr = root
        for ch in Array(s) {
            if curr.children[ch] == nil {
                curr.children[ch] = Node()
            }
            curr = curr.children[ch]!
        }
        curr.terminal = true
    }
    
    class Node {
        var terminal = false
        var children = [Character:Node]()
    }
}
