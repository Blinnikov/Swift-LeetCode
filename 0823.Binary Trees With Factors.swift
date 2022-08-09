class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let n = arr.count
        let base = 1000000007
        var dp = Array(repeating: 1, count: n)
        var arr = arr.sorted()
        var map = [Int:Int]()
        
        for i in 0..<n {
            map[arr[i]] = i
        }
        
        for i in 0..<n {
            for j in 0..<i {
                if arr[i] % arr[j] == 0 {
                    let rhs = arr[i] / arr[j]
                    print(rhs)
                    if map[rhs] != nil {
                        dp[i] += (dp[j] * dp[map[rhs]!] % base)
                    }
                }
            }
        }
        
        return dp.reduce(0, +) % base
    }
}
