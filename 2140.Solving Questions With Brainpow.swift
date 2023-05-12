class Solution {
    private var questions =  [[Int]]()
    private var dp = [Int]()

    func mostPoints(_ questions: [[Int]]) -> Int {
        self.questions = questions
        self.dp = Array(repeating: 0, count: questions.count)

        return recurse(0)
    }

    private func recurse(_ step: Int) -> Int {
        if step >= questions.count {
            return 0
        }

        if dp[step] != 0 {
            return dp[step]
        }

        dp[step] = max(
            recurse(step + 1),
            questions[step][0] + recurse(step + questions[step][1] + 1)
            )

        return dp[step]
    }
}
