class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        
        var fresh = 0
        var rottenCoords = [(Int,Int)]()
        var mins = -1
        
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 1 {
                    fresh += 1
                }
                if grid[r][c] == 2 {
                    rottenCoords.insert((r,c), at: 0)
                }
            }
        }
        
        if fresh == 0 {
            return 0
        }
        
        while rottenCoords.count != 0 {
            var count = rottenCoords.count
            while count > 0 {
                let (r,c) = rottenCoords.removeLast()
                count -= 1
                
                // left
                if c > 0 && grid[r][c-1] == 1 {
                    grid[r][c-1] = 2
                    rottenCoords.insert((r,c-1), at: 0)
                    fresh -= 1
                }
                // top
                if r > 0 && grid[r-1][c] == 1 {
                    grid[r-1][c] = 2
                    rottenCoords.insert((r-1,c), at: 0)
                    fresh -= 1
                }
                // right
                if c < cols-1 && grid[r][c+1] == 1 {
                    grid[r][c+1] = 2
                    rottenCoords.insert((r,c+1), at: 0)
                    fresh -= 1
                }
                // bottom
                if r < rows-1 && grid[r+1][c] == 1 {
                    grid[r+1][c] = 2
                    rottenCoords.insert((r+1,c), at: 0)
                    fresh -= 1
                }
            }
            
            mins += 1
        }
        
        if fresh == 0 {
            return mins
        }
        
        return -1
    }
}
