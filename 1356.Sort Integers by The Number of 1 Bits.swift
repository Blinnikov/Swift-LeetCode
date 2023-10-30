class Solution {
    private let nonExistingValue = 10_001

    func sortByBits(_ arr: [Int]) -> [Int] {
        var res = arr

        for i in 0..<arr.count {
            res[i] = arr[i] + bitsCount(arr[i]) * 10_001
        }


        res.sort()

        for i in 0..<res.count {
            res[i] %= 10_001
        }

        return res
    }

    private func bitsCount(_ n: Int) -> Int {
        var n = n
        var res = 0

        while n > 0 {
            res += n & 1
            n >>= 1
        }

        return res
    }
}
