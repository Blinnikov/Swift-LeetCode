class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var losses = Array(repeating: -1, count: 100001)

        for match in matches {
            let winner = match[0]
            let loser = match[1]

            if losses[winner] == -1 {
                losses[winner] = 0
            }
            if losses[loser] == -1 {
                losses[loser] = 1
            } else {
                losses[loser] += 1
            }
        }

        var result = Array(repeating: [Int](), count: 2)
        for i in 1..<100001 {
            if losses[i] == 0 {
                result[0].append(i)
            } else if losses[i] == 1 {
                result[1].append(i)
            }
        }

        return result
    }
}
