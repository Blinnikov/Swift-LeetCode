class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        let rows = mat.count, cols = mat[0].count
        var map = [Int:[Int]]()
        
        for row in 0..<rows {
            for col in 0..<cols {
                map[row-col, default: .init()].append(mat[row][col])
            }
        }
        
        for k in map.keys {
            map[k]!.sort()
        }
        
        var mat = mat
        for row in 0..<rows {
            for col in 0..<cols {
                mat[row][col] = map[row-col]!.removeFirst()
            }
        }
            
        return mat
    }
}
