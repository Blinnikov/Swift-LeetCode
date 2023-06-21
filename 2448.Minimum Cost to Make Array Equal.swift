class Solution {
    private var nums = [Int]()
    private var costs = [Int]()

    func minCost(_ nums: [Int], _ costs: [Int]) -> Int {
        self.nums = nums
        self.costs = costs

        var lo = min(nums.min()!, 1)
        var hi = max(nums.max()!, 1_000_000)

        var res = 0

        while lo < hi {
            let mid = (lo + hi) / 2

            let cost1 = cost(for: mid)
            let cost2 = cost(for: mid + 1)

            res = min(cost1, cost2)

            if cost1 < cost2 {
                hi = mid
            } else {
                lo = mid + 1
            }
        }

        return res    
    }

    private func cost(for val: Int) -> Int {
        var res = 0

        for i in 0..<nums.count {
            res += costs[i] * abs(nums[i] - val)
        }

        return res
    }
}
