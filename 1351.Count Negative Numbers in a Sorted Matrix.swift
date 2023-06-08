class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var res = 0

        for row in stride(from: grid.count - 1, through: 0, by: -1)  {
            for col in stride(from: grid[0].count - 1, through: 0, by: -1) {
                if grid[row][col] < 0 {
                    res += 1
                }
            }
        }

        return res
    }
}
