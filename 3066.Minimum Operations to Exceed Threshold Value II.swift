class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var pq = PriorityQueue<Int>(sort: <, elements: nums)

        var res = 0

        while let el = pq.peek, el < k {
            let first = pq.dequeue()!
            let second = pq.dequeue()!

            pq.enqueue(min(first, second) * 2 + max(first, second))

            res += 1
        }

        return res
    }
}
