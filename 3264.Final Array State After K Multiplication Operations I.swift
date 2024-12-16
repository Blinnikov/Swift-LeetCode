class Solution {
    func getFinalState(_ nums: [Int], _ k: Int, _ multiplier: Int) -> [Int] {
        var pq = PriorityQueue<Element> { $0.num == $1.num ? $0.idx < $1.idx : $0.num < $1.num }

        for i in 0..<nums.count {
            pq.enqueue(Element(num: nums[i], idx: i))
        }

        for i in 0..<k {
            let el = pq.dequeue()!
            pq.enqueue(Element(num: el.num * multiplier, idx: el.idx))
        }

        var res = Array(repeating: 0, count: nums.count)

        while !pq.isEmpty {
            let el = pq.dequeue()!
            res[el.idx] = el.num
        }

        return res
    }
}

struct Element : Equatable {
    var num: Int
    var idx: Int
}
