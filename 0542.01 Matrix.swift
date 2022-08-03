class Solution {
    private let UNPROCESSED = -1
    
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        
        let rows = mat.count, cols = mat[0].count
        var queue = [(r:Int, c:Int)]()
        
        for r in 0..<rows {
            for c in 0..<cols {
                if mat[r][c] == 0 {
                    queue.insert((r,c), at: 0)
                } else {
                    mat[r][c] = UNPROCESSED
                }
            }
        }
        
        while queue.count != 0 {
            let (r,c) = queue.removeLast()
            
            // top
            if r > 0 && mat[r-1][c] == UNPROCESSED {
                mat[r-1][c] = mat[r][c] + 1
                queue.insert((r-1,c), at: 0)
            }
            // right
            if c < cols-1 && mat[r][c+1] == UNPROCESSED {
                mat[r][c+1] = mat[r][c] + 1
                queue.insert((r,c+1), at: 0)
            }
            // bottom
            if r < rows-1 && mat[r+1][c] == UNPROCESSED {
                mat[r+1][c] = mat[r][c] + 1
                queue.insert((r+1,c), at: 0)
            }
            // left
            if c > 0 && mat[r][c-1] == UNPROCESSED {
                mat[r][c-1] = mat[r][c] + 1
                queue.insert((r,c-1), at: 0)
            }
        }
        
        return mat
    }
}
