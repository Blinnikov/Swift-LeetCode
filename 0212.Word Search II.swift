class Solution {

    private var maxCount = -1
    private var result: Set<String> = []
    private var map = [[Character?]:Bool]()
    // private var map2 = [String:Bool]()
    private var emptyBoard = [[Bool]]()
    private var emptyWord = [Character?]()

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {

        emptyBoard = Array(repeating: Array(repeating: false, count: board[0].count),count: board.count)

        for i in 0..<words.count {
            let chars = Array(words[i])
            map[chars] = true
            maxCount = max(maxCount, chars.count)
            // map2[words[i]] = true
            // maxCount = max(maxCount, words[i].count)
        }

        // print(map)

        emptyWord = Array(repeating: nil, count: maxCount)

        // print(emptyWord)

        for row in 0..<board.count {
            for col in 0..<board[0].count {
                var visited = emptyBoard
                // var word = [Character]()
                // word.reserveCapacity(maxCount)
                var word = emptyWord
                dfs(row, col, 0, board, &word, &visited)
                // dfs(row, col, board, "", &visited)
            }
        }

        return Array(result)
    }

    private func dfs(
        _ row: Int,
        _ col: Int,
        _ pos: Int,
        _ board: [[Character]],
        _ word: inout [Character?],
        // _ word: String,
        _ visited: inout [[Bool]]
        ) {
        if row < 0 || col < 0 || row >= board.count || col >= board[row].count
            || visited[row][col] || pos >= maxCount {
            return
        }

        visited[row][col] = true
        // word.append(board[row][col])
        word[pos] = board[row][col]

        // print(word)
        // var word = "\(word)\(board[row][col])"

        // print(word)

        let nonNilWord = word.filter { $0 != nil }.map { $0! }
        if map[nonNilWord] != nil {
            result.insert(String(nonNilWord))
            // result.insert(word)
        }

        dfs(row - 1, col, pos + 1, board, &word, &visited)
        dfs(row + 1, col, pos + 1, board, &word, &visited)
        dfs(row, col - 1, pos + 1, board, &word, &visited)
        dfs(row, col + 1, pos + 1, board, &word, &visited)

        // word.removeLast()
        word[pos] = nil
        visited[row][col] = false
    }
}
