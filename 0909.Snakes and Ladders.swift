class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        var cells: [(Int, Int)] = Array(repeating: (0, 0), count: n * n + 1)
        var cols = Array(repeating: 0, count: n)
        for i in 0..<n {
            cols[i] = i
        }

        var label = 1
        for row in stride(from: n - 1, through: 0, by: -1) {
            for col in cols {
                cells[label] = (row, col)
                label += 1
            }
            cols.reverse()
        }

        var distance = Array(repeating: -1, count: n * n + 1)
        var queue = [Int]()

        distance[1] = 0
        queue.append(1)

        while !queue.isEmpty {
            print(queue)
            let current = queue.removeLast()
            print(current, n * n)

            var next = current + 1
            let upperBound = min(current + 6, n * n)

            while next <= upperBound {
                let row = cells[next].0
                let col = cells[next].1
                let destination = board[row][col] != -1 ? board[row][col] : next
                
                if distance[destination] == -1 {
                    distance[destination] = distance[current] + 1
                    queue.insert(destination, at: 0)
                }

                next += 1
            }
        }

        return distance[n * n]
    }
}
