
class MyHashMap {
    private let maxCount = 1_000_001
    private var storage: [Int]

    init() {
        storage = Array(repeating: -1, count: maxCount)
    }
    
    func put(_ key: Int, _ value: Int) {
        storage[key] = value
    }
    
    func get(_ key: Int) -> Int {
        if key >= maxCount {
            return -1
        }

        return storage[key]
    }
    
    func remove(_ key: Int) {
        storage[key] = -1
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
