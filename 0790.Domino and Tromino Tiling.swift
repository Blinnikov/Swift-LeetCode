class Solution {
    private let mod = 1000000007
    func numTilings(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var full = Array(repeating: 0, count: n + 1)
        var part = Array(repeating: 0, count: n + 1)

        full[1] = 1
        full[2] = 2
        part[1] = 0
        part[2] = 1

        for i in 3...n {
            full[i] = (full[i - 1] + full[i - 2] + 2 * part[i - 1]) % mod
            part[i] = (part[i - 1] + full[i - 2]) % mod
        }
               
        return full[n]
    }
}
