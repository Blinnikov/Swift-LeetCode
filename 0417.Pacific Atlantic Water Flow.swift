class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let cols = heights[0].count
        
        var pacific = Set<[Int]>()
        var pq = [[Int]]()
        
        for r in 0..<rows {
            pq.append([r, 0])
        }
        
        for c in 1..<cols {
            pq.append([0, c])
        }
        
        while !pq.isEmpty {
            let cur = pq.removeLast()
            let r = cur[0], c = cur[1]
            
            pacific.insert(cur)
            
            // top
            if r > 0 && !pacific.contains([r-1, c]) && heights[r][c] <= heights[r-1][c] {
                pq.append([r-1, c])
            }
            
            // right
            if c < cols-1 && !pacific.contains([r, c+1]) && heights[r][c] <= heights[r][c+1] {
                pq.append([r, c+1])
            }
            
            // bottom
            if r < rows-1 && !pacific.contains([r+1, c]) && heights[r][c] <= heights[r+1][c] {
                pq.append([r+1, c])
            }
            
            // left 
            if c > 0 && !pacific.contains([r, c-1]) && heights[r][c] <= heights[r][c-1] {
                pq.append([r, c-1])
            }
        }
        
        var atlantic = Set<[Int]>()
        var aq = [[Int]]()
        
        for r in 0..<rows {
            aq.append([r, cols-1])
        }
        
        for c in 0..<cols-1 {
            aq.append([rows-1, c])
        }
        
        while !aq.isEmpty {
            let cur = aq.removeLast()
            let r = cur[0], c = cur[1]
            
            atlantic.insert(cur)
            
            // top
            if r > 0 && !atlantic.contains([r-1, c]) && heights[r][c] <= heights[r-1][c] {
                aq.append([r-1, c])
            }
            
            // right
            if c < cols-1 && !atlantic.contains([r, c+1]) && heights[r][c] <= heights[r][c+1] {
                aq.append([r, c+1])
            }
            
            // bottom
            if r < rows-1 && !atlantic.contains([r+1, c]) && heights[r][c] <= heights[r+1][c] {
                aq.append([r+1, c])
            }
            
            // left 
            if c > 0 && !atlantic.contains([r, c-1]) && heights[r][c] <= heights[r][c-1] {
                aq.append([r, c-1])
            }
        }
        
        return Array(pacific.intersection(atlantic))
    }
}
