class SummaryRanges {
    private var _set: Set<Int>

    init() {
        _set = []
    }
    
    func addNum(_ value: Int) {
        _set.insert(value)
    }
    
    func getIntervals() -> [[Int]] {
        if _set.isEmpty {
            return [[]]
        }
        
        var intervals = [[Int]]()
        var left = -1
        var right = -1

        for val in _set.sorted() {
            if left < 0 {
                left = val
                right = val
            } else if val == right + 1 {
                right = val
            } else {
                intervals.append([left, right])
                left = val
                right = val
            }
        }

        intervals.append([left, right])

        return intervals
    }
}

/**
 * Your SummaryRanges object will be instantiated and called as such:
 * let obj = SummaryRanges()
 * obj.addNum(value)
 * let ret_2: [[Int]] = obj.getIntervals()
 */
