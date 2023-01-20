class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var seq = [Int]()
        backtrack(nums, 0, &seq, &result)
        return Array(result)
    }

    private func backtrack(_ nums: [Int], _ idx: Int, _ seq: inout [Int], _ result: inout Set<[Int]>) {
        if idx == nums.count {
            if seq.count >= 2 {
                result.insert(seq)
            }
            return
        }

        if seq.isEmpty || seq.last! <= nums[idx] {
                seq.append(nums[idx])
                backtrack(nums, idx + 1, &seq, &result)
                seq.removeLast()
        }

        backtrack(nums, idx + 1, &seq, &result)
    }
}
