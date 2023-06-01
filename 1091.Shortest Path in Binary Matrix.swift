class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        solve(grid)
    }
    
    private func solve(_ grid: [[Int]]) -> Int {
        if grid[0][0] == 1 {
            return -1
        }
        
        let n = grid.count
        var queue = [(Int, Int)]()
        queue.append((0, 0))
        
        var visited = Array(repeating: false, count: n*n)
        visited[0] = true
        var prev = Array(repeating: -1, count: n*n)
        
        while !queue.isEmpty {
            let coord = queue.removeFirst()
            
            if coord.0 == n-1 && coord.1 == n-1 {
                print("Solution found")
                break
            }
            
            let neighbours = getNeighbours(coord, n)
            
            for neighbour in neighbours {
                let idx = translateCoordToIndex(neighbour, n)

                if !visited[idx] && grid[neighbour.0][neighbour.1] == 0 {
                    queue.append(neighbour)
                    visited[idx] = true
                    prev[idx] = translateCoordToIndex(coord, n)
                }
            }
        }
        
        var path = 1
        var idx = n*n-1
        while prev[idx] != -1 {
            idx = prev[idx]
            path += 1
        }
        
        if idx != 0 {
            return -1
        }
        
        return path
    }
    
    private func getNeighbours(_ node: (Int, Int), _ n: Int) -> [(Int, Int)] {
        let xCoord = [-1, 0, 1, 1, 1, 0, -1, -1]
        let yCoord = [-1, -1, -1, 0, +1, +1, +1, 0]
        var result = [(Int, Int)]()
        
        for i in 0..<8 {
            let newX = node.0 + xCoord[i]
            if newX < 0 || newX >= n {
                continue
            }
            let newY = node.1 + yCoord[i]
            if newY < 0 || newY >= n {
                continue
            }
            
            result.append((newX, newY))
        }
        
        return result
    }
    
    private func translateCoordToIndex(_ coord: (Int, Int), _ n: Int) -> Int {
        coord.0 * n + coord.1
    }
}
