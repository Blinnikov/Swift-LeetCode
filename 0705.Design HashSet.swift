class MyHashSet {
    private var storage = [Int]()

    init() {
        
    }
    
    func add(_ key: Int) {
        if !storage.contains(key) {
            storage.append(key)
        }
    }
    
    func remove(_ key: Int) {
        if let idx = storage.firstIndex(of: key) {
            storage.remove(at: idx)
        }

    }
    
    func contains(_ key: Int) -> Bool {
        storage.contains(key)
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
