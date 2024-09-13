class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var x = Array(repeating: 0, count: arr.count + 1)

        for i in 0..<arr.count {
            x[i + 1] = arr[i] ^ x[i]
        }

        var res = Array(repeating: 0, count: queries.count)

        for i in 0..<res.count {
            let q = queries[i]
            res[i] = x[q[1] + 1] ^ x[q[0]]
        }

        return res
    }
}
