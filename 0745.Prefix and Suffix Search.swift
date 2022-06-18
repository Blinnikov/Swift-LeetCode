class Node {
    var children = [Character:Node]()
    var order = -1
}

class WordFilter {
    
    private let separator = "#"
    private let trie = Node()

    init(_ words: [String]) {
        for (o, w) in words.enumerated() {
            let word = Array(w + separator)
            for i in 0..<word.count {
                var cur = trie
                cur.order = o
                
                for j in i..<2*word.count-1 {
                    var ch = word[j % word.count]
                    if cur.children[ch] == nil {
                        cur.children[ch] = Node()
                    }
                    cur = cur.children[ch]!
                    cur.order = o
                }
            }
        }
    }
    
    func f(_ prefix: String, _ suffix: String) -> Int {
        var cur = trie
        for ch in Array(suffix + separator + prefix) {
            if cur.children[ch] == nil {
                return -1
            }
            cur = cur.children[ch]!
        }
        return cur.order
    }
}

/**
 * Your WordFilter object will be instantiated and called as such:
 * let obj = WordFilter(words)
 * let ret_1: Int = obj.f(prefix, suffix)
 */
