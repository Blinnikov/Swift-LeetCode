class Solution {
    private var k = 0
    private var res = Int.max
    private var distribution = [Int]()
    private var cookies = [Int]()

    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        self.k = k
        self.distribution = Array(repeating: 0, count: k)
        self.cookies = cookies

        backtrack(0)

        return res
    }

    private func backtrack(_ idx: Int) {
        if idx == cookies.count {
            res = min(res, distribution.max()!)
            return
        }

        for i in 0..<k {
            distribution[i] += cookies[idx]
            backtrack(idx + 1)
            distribution[i] -= cookies[idx]
        }
    }
}
