class Solution {
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        var n = stations.count
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = startFuel
        
        for i in 0..<n {
            for j in stride(from: i, through: 0, by: -1) {
                // print(j,  dp)
                if dp[j] >= stations[i][0] {
                    dp[j+1] = max(dp[j+1], dp[j]+stations[i][1])
                    // print(dp)
                }
            }
        }
        
        for i in 0...n {
            if dp[i] >= target {
                return i
            }
        }
        
        return -1
    }
}
