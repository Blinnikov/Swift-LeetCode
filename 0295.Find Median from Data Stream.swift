class MedianFinder {
    private var _storage: [Int]
    private var _count: Int = 0

    init() {
        self._storage = [Int]()
    }
    
    func addNum(_ num: Int) {
        if let idx = _storage.index(where: { $0 > num }) {
            _storage.insert(num, at: idx)
        } else {
            _storage.append(num)
        }

        _count += 1
    }
    
    func findMedian() -> Double {
        if _count <= 0 {
            return 0
        }

        if _count & 1 == 0 {
            return Double(_storage[_storage.count / 2] + _storage[_storage.count / 2 - 1]) / 2.0
        }

        return Double(_storage[_storage.count / 2])
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
