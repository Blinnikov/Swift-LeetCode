class Solution {
    private var players: [(age: Int, score: Int)] = [];
    private var dp = [[Int]]()

    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let n = ages.count

        players = Array(repeating: (0,0), count: n)
        for i in 0..<n {
            players[i] = (age: ages[i], score: scores[i])
        }

        players.sort { $0.age == $1.age ? $0.score < $1.score : $0.age < $1.age }

        dp = Array(repeating: Array(repeating: -1, count: n), count: n)

        return recurse(0, -1)
    }

    private func recurse(_ currIdx: Int, _ prevIdx: Int) -> Int {
        if currIdx >= players.count {
            return 0
        }

        if dp[prevIdx + 1][currIdx] != -1 {
            return dp[prevIdx + 1][currIdx]
        }

        if prevIdx == -1 ||
            players[currIdx].score >= players[prevIdx].score {
                dp[prevIdx + 1][currIdx] = max(
                    recurse(currIdx + 1, prevIdx),
                    players[currIdx].score + recurse(currIdx + 1, currIdx)
                )
            return dp[prevIdx + 1][currIdx]
        }

        dp[prevIdx + 1][currIdx] = recurse(currIdx + 1, prevIdx)
        return dp[prevIdx + 1][currIdx]
    }
}
