class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let lastTravellingDay = days.last!

        var dp = Array(repeating: 0, count: lastTravellingDay + 1)

        var hasTravelOnThisDay = Array(repeating: false, count: lastTravellingDay + 1)

        for day in days {
            hasTravelOnThisDay[day] = true
        }

        for day in 1...lastTravellingDay {
            if !hasTravelOnThisDay[day] {
                dp[day] = dp[day - 1]
                continue
            }

            dp[day] = costs[0] + dp[day - 1]
            dp[day] = min(costs[1] + dp[max(day - 7, 0)], dp[day])
            dp[day] = min(costs[2] + dp[max(day - 30, 0)], dp[day])
        }

        return dp.last!
    }
}
