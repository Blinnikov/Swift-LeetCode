class Solution {
    private var events = [[Int]]()
    private var dp = [[Int]]()

    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        self.events = events.sorted { $0[0] < $1[0] }
        self.dp = Array(repeating: Array(repeating: -1, count: events.count), count: k + 1)

        return dfs(0, k)
    }

    private func search(_ val: Int) -> Int {
        var lo = 0
        var hi = self.events.count

        while lo < hi {
            let mid = (lo + hi) / 2

            if self.events[mid][0] <= val {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo
    }

    private func dfs(_ idx: Int, _ count: Int) -> Int {
        if count == 0 || idx == events.count {
            return 0
        }

        if dp[count][idx] != -1 {
            return dp[count][idx]
        }

        let next = search(self.events[idx][1])

        dp[count][idx] = max(dfs(idx + 1, count), events[idx][2] + dfs(next, count - 1))

        return dp[count][idx]
    }
}
