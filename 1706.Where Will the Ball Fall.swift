class Solution {
    private var grid = [[Int]]()
    private var rows = 0
    private var cols = 0
    
    func findBall(_ grid: [[Int]]) -> [Int] {
        self.grid = grid
        self.rows = grid.count
        self.cols = grid[0].count
        
        var res = Array(repeating: 0, count: cols)
        
        for i in 0..<cols {
            res[i] = solve(0, i)
        }
        
        return res
    }
    
    private func solve(_ row: Int,_ col: Int) -> Int {
        if !checkCell(row,col) {
            return -1
        }
        
        if row == rows - 1 {
            // print(col, grid[row][col])
            return col + grid[row][col]
        }

        return grid[row][col] == 1 
            ? solve(row + 1, col + 1) 
            : solve(row + 1, col - 1);
    }
    
    private func checkCell(_ row: Int, _ col: Int) -> Bool {
        if row < 0 || row >= rows || col < 0 || col >= cols {
            return false
        }
        
        let slope = grid[row][col]
        let nextCol = col + slope
        
        if nextCol < 0 || nextCol >= cols {
            return false
        }
        
        // V - case
        if grid[row][nextCol] == -1 * slope {
            return false
        }
        
        return true
    }
}
