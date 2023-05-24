class Solution {
    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var pairs = Array(repeating: (0, 0), count: nums1.count)
        for i in 0..<nums1.count {
            pairs[i] = (nums2[i], nums1[i])
        }

        pairs.sort { $1.0 < $0.0 }

        var pq = PriorityQueue<Int>(sort: <)

        var res = 0
        var sum = 0

        for pair in pairs {
            pq.enqueue(pair.1)
            sum += pair.1

            if pq.count > k {
                sum -= pq.dequeue()!
            }

            if pq.count == k {
                res = max(res, sum * pair.0)
            }

        }

        return res
    }
}
