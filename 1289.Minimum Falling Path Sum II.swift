class Solution {
    func minFallingPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 1 {
            return grid[0][0]
        }

        var prevRowIdx = -1
        var prevRowMin1 = 0
        var prevRowMin2 = 0

        for row in 0..<grid.count {
            var currRowMin1 = Int.max
            var currRowMin2 = Int.max
            var currRowIdx = -1

            for col in 0..<grid[row].count {
                let prevRowMin = col == prevRowIdx ? prevRowMin2 : prevRowMin1
                let currRowMinCandidate = grid[row][col] + prevRowMin
                
                if currRowMinCandidate < currRowMin1 {
                    currRowMin2 = currRowMin1
                    currRowMin1 = currRowMinCandidate
                    currRowIdx = col
                } else {
                    currRowMin2 = min(currRowMin2, currRowMinCandidate)
                }
            }

            prevRowMin1 = currRowMin1
            prevRowMin2 = currRowMin2
            prevRowIdx = currRowIdx
        }

        return prevRowMin1
    }
}
