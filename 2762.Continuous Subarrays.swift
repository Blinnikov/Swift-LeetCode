class Solution {
    func continuousSubarrays(_ nums: [Int]) -> Int {
        var minPq = PriorityQueue<Int> { nums[$0] < nums[$1] }
        var maxPq = PriorityQueue<Int> { nums[$0] > nums[$1] }

        var lo = 0
        var hi = 0

        var res = 0

        while hi < nums.count {
            minPq.enqueue(hi)
            maxPq.enqueue(hi)

            while lo < hi, nums[maxPq.peek!] - nums[minPq.peek!] > 2 {
                lo += 1

                while !maxPq.isEmpty && maxPq.peek! < lo {
                    maxPq.dequeue()
                }

                while !minPq.isEmpty && minPq.peek! < lo {
                    minPq.dequeue()
                }
            }

            res += (hi - lo + 1)
            hi += 1
        }

        return res
    }
}
