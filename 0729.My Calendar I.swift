
class MyCalendar {
    
    private var events: [(start:Int, end: Int)]

    init() {
        self.events = [(Int,Int)]()
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        if events.count == 0 {
            events.append((start, end))
            return true
        }
        
        let idx = findSlot(start)
        
        if idx == events.count {
            if events[idx-1].end <= start {
                events.append((start, end))
                return true
            }
        }
        
        if idx == 0 {
            if events[0].start >= end {
                events.insert((start, end), at: 0)
                return true
            }
        }
        
        if idx - 1 >= 0 {
            let prevEvent = events[idx-1]
            if prevEvent.end <= start && events[idx].start >= end {
                events.insert((start, end), at: idx)
                return true
            }
        }
        
        
        return false
    }
    
    private func findSlot(_ start: Int) -> Int {
        var lo = 0, hi = events.count-1
        
        while lo <= hi {
            let mid = lo + (hi-lo)/2
            if events[mid].start == start {
                return mid
            }
            if events[mid].start < start {
                lo = mid + 1
            } else {
                hi = mid-1
            }
        }
        return lo
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */
