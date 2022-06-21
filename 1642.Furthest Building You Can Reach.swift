class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var bricks = bricks
        var q = Queue(capacity: heights.count)
        
        for i in 1..<heights.count {
            let diff = heights[i] - heights[i-1]
            if diff > 0 {
                q.enqueue(diff)
            }
            if q.count > ladders {
                bricks -= q.dequeue()
            }
            if bricks < 0 {
                return i-1
            }
        }
        
        return heights.count - 1
    }
}

class Queue {
    private var items: [Int]
    
    init(capacity: Int) {
        self.items = [Int]()
        self.items.reserveCapacity(capacity)
    }
    
    func enqueue(_ item: Int) {
        items.append(item)
    }
    
    func dequeue() -> Int {
        let idx = items.indices.min { items[$0] < items[$1] }!
        let res = items[idx]
        items.remove(at: idx)
        return res
    }
    
    var count: Int {
        items.count
    }
}
