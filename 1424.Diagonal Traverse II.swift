class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var map = [Int:[Int]]()

        for row in 0..<nums.count {
            for col in 0..<nums[row].count {
                let diag = row + col
                map[diag, default: [Int]()].append(nums[row][col])
            }
        }

        var res = [Int]()

        for (k, diag) in map.sorted { $0.0 < $1.0 } {
            res += diag.reversed()
        }

        return res
    }
}
