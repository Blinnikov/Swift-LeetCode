
class LRUCache {
    private let capacity: Int
    private var count: Int
    private var map = [Int:TreeNode]()
    private var head: TreeNode?
    private var tail: TreeNode?

    init(_ capacity: Int) {
        self.capacity = capacity
        self.count = 0
    }
    
    func get(_ key: Int) -> Int {
        if self.count == 0 {
            return -1
        }
        
        if let node = map[key] {
            moveNodeToHead(node)
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if var node = map[key] {
            node.val = value
            moveNodeToHead(node)
            return
        }
        
        let node = TreeNode(key, value)
        
        if head == nil {
            head = node
            tail = node
        } else {
            head!.next = node
            node.prev = head
            head = node
        }
        
        map[key] = node
        count += 1
        
        if count > capacity {
            var tailNext = tail!.next
            map[tail!.key] = nil
            if tailNext != nil {
                tailNext!.prev = nil
                tail = tailNext
            } else {
                tail = nil
                head = nil
            }

            count -= 1
        }
    }
    
    private func moveNodeToHead(_ node: TreeNode) {
        if count == 1 {
            node.prev = nil
            node.next = nil
            head = node
            tail = node
        } else {
            // if is tail node
            if node.key == tail!.key {
                tail = tail!.next
            }
        
            // if is in the middle of the list
            if node.key != head!.key {
                let nodePrev = node.prev
                let nodeNext = node.next

                // extract node, pointing its neighbours to each other
                if nodePrev != nil {
                    nodePrev!.next = nodeNext
                }

                if nodeNext != nil {
                    nodeNext!.prev = nodePrev
                }

                // making node the new head
                node.next = nil
                head!.next = node
                node.prev = head
                head = node
            }
        }
    }
    
    private func printList() {
        var res = "List: "
        var pointer = tail
        
        while(pointer != nil) {
            res += "(\(pointer!.key):\(pointer!.val))->"
            pointer = pointer!.next
        }
        
        print(res)
        
        res = "Reverse List: "
        pointer = head
        
        while(pointer != nil) {
            res += "(\(pointer!.key):\(pointer!.val))->"
            pointer = pointer!.prev
        }
        
        print(res)
    }
    
    private func printMap() {
        print("Map: ", map)
    }
    
    private class TreeNode: CustomStringConvertible {
        let key: Int
        var val: Int
        var prev: TreeNode?
        var next: TreeNode?
        
        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
        
        init(_ key: Int, _ val: Int, _ prev: TreeNode, _ next: TreeNode) {
            self.key = key
            self.val = val
            self.prev = prev
            self.next = next
        }
        
        var description: String {
            return "(\(key):\(val))"
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
