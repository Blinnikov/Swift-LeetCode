
class SeatManager {
    var pq = PriorityQueue<Int>(sort: <)

    init(_ n: Int) {
        for i in 1...n {
            pq.enqueue(i)
        }
    }
    
    func reserve() -> Int {
        if let seat = pq.peek {
            return pq.dequeue()!
        }

        return -1
    }
    
    func unreserve(_ seatNumber: Int) {
        pq.enqueue(seatNumber)
    }
}

/**
 * Your SeatManager object will be instantiated and called as such:
 * let obj = SeatManager(n)
 * let ret_1: Int = obj.reserve()
 * obj.unreserve(seatNumber)
 */
