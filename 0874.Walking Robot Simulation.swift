class Solution {
    private let dirs = [ (0, 1), (1, 0), (0, -1), (-1, 0) ]
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var set = Set<Int>()

        for o in obstacles {
            set.insert(hash(o[0], o[1]))
        }

        var pos = (0, 0)
        var dir = 0
        var res = 0

        for c in commands {
            if c == -1 {
                dir = (dir + 1) % 4
                continue
            }

            if c == -2 {
                dir = (dir + 3) % 4
                continue
            }

            let d = dirs[dir]

            for i in 0..<c {
                let col = pos.0 + d.0
                let row = pos.1 + d.1

                if set.contains(hash(col, row)) {
                    break
                }

                pos = (col, row)

                res = max(res, pos.0 * pos.0 + pos.1 * pos.1)
            }
        }

        return res
    }

    private func hash(_ row: Int, _ col: Int) -> Int {
        row + 60_001 * col
    }
}
