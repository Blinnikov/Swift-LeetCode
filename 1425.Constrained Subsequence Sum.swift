class Solution {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        var sum = nums
        var deq = [Int]()
        var res = sum[0]

        for i in 0..<nums.count {
            sum[i] += deq.isEmpty ? 0 : deq.last!

            res = max(res, sum[i])

            while !deq.isEmpty, sum[i] > deq.first! {
                deq.removeFirst()
            }

            if sum[i] > 0 {
                deq.insert(sum[i], at: 0)
            }

            if i >= k, !deq.isEmpty, deq.last! == sum[i - k] {
                deq.removeLast()
            }
        }

        return res
    }
}
