
class MyQueue {
    var left: [Int]
    var right: [Int]

    init() {
        left = []
        right = []
    }
    
    func push(_ x: Int) {
        left.append(x)
    }
    
    func pop() -> Int {
        if right.isEmpty {
            while !left.isEmpty {
                right.append(left.removeLast())
            }
        }
        
        return right.removeLast()
    }
    
    func peek() -> Int {
        if right.isEmpty {
            while !left.isEmpty {
                right.append(left.removeLast())
            }
        }
        
        return right.last!
    }
    
    func empty() -> Bool {
        left.isEmpty && right.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
