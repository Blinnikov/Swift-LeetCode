class Solution {
    private var res = 0
    private var seen = [Int:Int]()

    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums

        traverse(&nums, k, 0)

        return res - 1
    }

    private func traverse(_ nums: inout[Int], _ k: Int, _ idx: Int) {
        if nums.count == idx {
            res += 1
            return
        }

        let n = nums[idx]

        if seen[n - k] == nil, seen[n + k] == nil {
            seen[n, default: 0] += 1

            traverse(&nums, k, idx + 1)

            seen[n, default: 0] -= 1

            if seen[n] == 0 {
                seen[n] = nil
            }
        }

        traverse(&nums, k, idx + 1)
    }
}
