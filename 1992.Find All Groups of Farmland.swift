class Solution {
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        var land = land

        let rows = land.count
        let cols = land[0].count

        var visited = Array(
            repeating: Array(repeating: false, count: cols),
            count: rows
        )

        var res = [[Int]]()

        for r in 0..<rows {
            for c in 0..<cols {
                if visited[r][c] {
                    continue
                }

                if land[r][c] == 0 {
                    visited[r][c] = true
                    continue
                }

                let r1 = r
                let c1 = c 

                let (r2, c2) = scanGroup(&land, &visited, r, c)

                res.append([r1, c1, r2, c2])
            }
        }

        return res
    }

    private func scanGroup(_ land: inout [[Int]], _ visited: inout [[Bool]], _ r1: Int, _ c1: Int) -> (Int, Int) {
        var r2 = r1
        var c2 = c1

        while r2 < land.count, land[r2][c1] != 0 {
            r2 += 1
        }

        r2 -= 1

        while c2 < land[0].count, land[r1][c2] != 0 {
            c2 += 1
        }

        c2 -= 1

        var r = r1

        while r <= r2 {
            var c = c1 

            while c <= c2 {
                visited[r][c] = true
                c += 1
            }

            r += 1
        }

        return (r2, c2)
    }
}
