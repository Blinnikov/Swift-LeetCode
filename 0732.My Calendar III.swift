
class MyCalendarThree {
    
    private let MaxEvent = 1000000000
    private var values: [Int:Int]
    private var _lazy: [Int:Int]

    init() {
        values = [Int:Int]()
        _lazy = [Int:Int]()
    }
    
    func book(_ start: Int, _ end: Int) -> Int {
        update(start, end-1, 0, MaxEvent, 1)
        return values[1, default: 0]
    }
    
    private func update(_ s: Int, _ e: Int, _ l: Int, _ r: Int, _ idx: Int) {
        if s > r || e < l {
            return
        }
        
        if s <= l && r <= e {
            values[idx] = values[idx, default: 0] + 1
            _lazy[idx] = _lazy[idx, default: 0] + 1
        } else {
            let mid = (l + r) / 2
            update(s, e, l, mid, 2 * idx)
            update(s, e, mid + 1, r, 2 * idx + 1)
            
            values[idx] = _lazy[idx, default: 0] + max(
                values[2 * idx, default: 0],
                values[2 * idx + 1, default: 0]
            )
        }
    }
}

/**
 * Your MyCalendarThree object will be instantiated and called as such:
 * let obj = MyCalendarThree()
 * let ret_1: Int = obj.book(start, end)
 */
