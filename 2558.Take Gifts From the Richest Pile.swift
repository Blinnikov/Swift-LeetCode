class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        var pq = PriorityQueue(sort: >, elements: gifts)

        for i in 0..<k {
            let el = pq.dequeue()!
            
            let sqrt = Int(Double(el).squareRoot())

            pq.enqueue(sqrt)            
        }

        var res = 0

        while !pq.isEmpty {
            res += pq.dequeue()!
        }

        return res
    }
}
