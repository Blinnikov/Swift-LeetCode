class RandomizedSet {
    private var set: Set<Int>

    init() {
        set = []
    }
    
    func insert(_ val: Int) -> Bool {
        if set.contains(val) {
            return false
        }

        set.insert(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if let r = set.remove(val) {
            return true
        }

        return false
    }
    
    func getRandom() -> Int {
        set.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
