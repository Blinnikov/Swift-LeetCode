class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        var jobs: [(Int, Int, Int)] = Array(repeating: (0, 0, 0), count: startTime.count)
        for i in 0..<startTime.count {
            jobs[i] = (startTime[i], endTime[i], profit[i])
        }
        jobs.sort{ $0.1 < $1.1 }

        var dp = Array(repeating: 0, count: startTime.count)
        dp[0] = jobs[0].2

        for i in 1..<jobs.count {
            dp[i] = max(jobs[i].2, dp[i - 1])
            for j in stride(from: i - 1, through: 0, by: -1) {
                if jobs[j].1 <= jobs[i].0 {
                    dp[i] = max(dp[i], jobs[i].2 + dp[j])
                    break
                }
            }
        }

        return dp.max()!
    }
}
