class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        let maxDiff = difficulty.max()!

        var diffProfitMap = Array(repeating: 0, count: maxDiff + 1)

        for i in 0..<difficulty.count {
            diffProfitMap[difficulty[i]] = max(profit[i], diffProfitMap[difficulty[i]])
        }

        for i in 1..<diffProfitMap.count {
            diffProfitMap[i] = max(diffProfitMap[i], diffProfitMap[i - 1])
        }

        var res = 0

        for w in worker {
            res += diffProfitMap[min(w, maxDiff)]
        }

        return res
    }
}
