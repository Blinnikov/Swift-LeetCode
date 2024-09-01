class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        if original.count != m * n {
            return []
        }

        var res = Array(repeating: Array(repeating: 0, count: n), count: m)

        for i in 0..<original.count {
            let val = original[i]

            let row = i / n
            let col = i % n

            res[row][col] = val
        }

        return res
    }
}
