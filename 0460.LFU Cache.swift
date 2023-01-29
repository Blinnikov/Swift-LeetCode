class LFUCache {
    private var storage: [Int:(freq: Int, val: Int)] = [:]
    private var frequencies: [Int:[Int]] = [:]
    private var minFreq: Int = 0
    private var capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    // Not O(1) because internally uses O(n) keys removal since Swift doesn't have something like OrderedHashSet data structure built in
    func get(_ key: Int) -> Int {
        if let item = storage[key] {
            let freq = item.0
            let val = item.1
            remove(key: key, from: &frequencies[freq]!)
            if minFreq == freq && frequencies[freq]!.isEmpty {
                minFreq += 1
            }
            insert(key, freq + 1, val)
            return val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity <= 0 {
            return
        }

        if let item = storage[key] {
            storage[key] = (item.0, value)
            get(key)
            return
        }

        if capacity == storage.count {
            let key = frequencies[minFreq]!.first!
            storage[key] = nil
            remove(key: key, from: &frequencies[minFreq]!)
        }

        minFreq = 1
        insert(key, 1, value)
    }

    private func insert(_ key: Int, _ freq: Int, _ val: Int) {
        storage[key] = (freq, val)
        if frequencies[freq] == nil {
            frequencies[freq] = [Int]()
        }

        remove(key: key, from: &frequencies[freq]!)
        frequencies[freq]!.append(key)
    }

    private func remove(key: Int, from collection: inout [Int]) {
        if let idx = collection.firstIndex { $0 == key } {
            collection.remove(at: idx)
        }
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
