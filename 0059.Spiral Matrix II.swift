class Solution {
    private var num = 1
    private var n = 0
    private var matrix = [[Int]]()

    func generateMatrix(_ n: Int) -> [[Int]] {
        self.n = n
        self.matrix = Array(repeating: Array(repeating: -1, count: n), count: n)
        let finalValue = n * n

        var direction = Direction.none

        var cell = (0, 0)
        while num <= finalValue {
            direction = direction.next()
            cell = fillLine(cell, direction)
        }

        return matrix
    }

    private func fillLine(_ from: (row: Int, col: Int), _ direction: Direction) -> (Int, Int) {
        var col = from.col
        var row = from.row

        print(direction, row, col)

        while row >= 0, row < n, col >= 0, col < n, matrix[row][col] == -1 {
            matrix[row][col] = num
            num += 1

            if direction == .right {
                col += 1
            } else if direction == .down {
                row += 1
            } else if direction == .left {
                col -= 1
            } else if direction == .top {
                row -= 1
            }
        }

        // get next start cell
        switch(direction) {
            case .right:
                col -= 1
                row += 1
            case .down:
                col -= 1
                row -= 1 
            case .left:
                col += 1
                row -= 1
            case .top:
                col += 1
                row += 1
            default: 
                print("Must never happen")
        }

        return (row, col)
    }

    enum Direction {
        case none
        case right
        case down
        case left
        case top

        func next() -> Direction {
            switch self {
                case .none:
                return .right
                case .right:
                return .down
                case .down:
                return .left
                case .left:
                return .top
                case .top:
                return .right
            }
        }
    }
}
