
class MyCircularQueue {
    
    private var storage: [Int]
    private var capacity = 0
    private var writeIdx = 0
    private var readIdx = 0

    init(_ k: Int) {
        self.capacity = k
        self.storage = Array(repeating: -1, count: k)
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        
        storage[writeIdx % capacity] = value
        writeIdx += 1
        
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        
        readIdx += 1
        return true
    }
    
    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        
        return storage[readIdx % capacity]
    }
    
    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        
        return storage[(writeIdx - 1) % capacity]
    }
    
    func isEmpty() -> Bool {
        writeIdx - readIdx == 0
    }
    
    func isFull() -> Bool {
        writeIdx - readIdx == capacity
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
