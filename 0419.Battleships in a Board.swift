class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var res = 0

        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if board[row][col] == "." {
                    continue
                }

                if row > 0, board[row - 1][col] == "X" {
                    continue
                }

                if col > 0, board[row][col - 1] == "X" {
                    continue
                }

                res += 1
            }
        }

        return res
    }
}
