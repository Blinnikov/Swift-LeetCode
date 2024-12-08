class Solution {
    func maxTwoEvents(_ events: [[Int]]) -> Int {
        var pq = PriorityQueue<Pair>(sort: { $0.first < $1.first })

        let events = events.sorted { $0[0] < $1[0] }

        print(events)

        var val = 0
        var res = 0

        for e in events {
            while !pq.isEmpty, pq.peek!.first < e[0] {
                val = max(val, pq.dequeue()!.second)
            }

            res = max(res, val + e[2])

            pq.enqueue(Pair(first: e[1], second: e[2]))
        }

        return res
    }
}

struct Pair : Equatable {
    var first: Int
    var second: Int
}
