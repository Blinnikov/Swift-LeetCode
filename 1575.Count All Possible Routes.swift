class Solution {
    private let mod = 1000000007

    private var dp = [[Int]]()
    private var locations = [Int]()

    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        self.locations = locations
        self.dp = Array(repeating: Array(repeating: -1, count: fuel + 1), count: locations.count)

        return traverse(start, finish, fuel)
    }

    private func traverse(_ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        if fuel < 0 {
            return 0
        }

        if dp[start][fuel] != -1 {
            return dp[start][fuel]
        }

        var total = start == finish ? 1 : 0

        for i in 0..<locations.count {
            if i != start, fuel >= abs(locations[i] - locations[start]) {
                total = (total + traverse(i, finish, fuel - abs(locations[i] - locations[start]))) % mod
            }
        }

        dp[start][fuel] = total

        return total
    }
}
