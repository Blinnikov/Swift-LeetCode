class SmallestInfiniteSet {
    private var current: Int
    private var set: Set<Int>

    init() {
        self.current = 1
        self.set = []
    }
    
    func popSmallest() -> Int {
        if set.isEmpty {
            current += 1
            return current - 1
        }

        return set.remove(set.min()!)!
    }
    
    func addBack(_ num: Int) {
        if current > num {
            set.insert(num)
        }
    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * let obj = SmallestInfiniteSet()
 * let ret_1: Int = obj.popSmallest()
 * obj.addBack(num)
 */
