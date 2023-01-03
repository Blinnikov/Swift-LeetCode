class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let rows = strs.count
        let cols = strs[0].count

        var matrix = Array(repeating: [Character](), count: rows)
        for i in 0..<rows {
            matrix[i] = Array(strs[i])
        }

        // print(matrix)

        var ans = 0

        for col in 0..<cols {
            for row in 0..<rows - 1 {
                if matrix[row][col] > matrix[row + 1][col] {
                    ans += 1
                    break
                }
            }
        }

        return ans
    }
}
