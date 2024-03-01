class Solution {
    func maximumOddBinaryNumber(_ s: String) -> String {
        let chars = Array(s)
        let count = chars.count
        let ones = chars.reduce(0, { $0 + ($1 == "1" ? 1 : 0) })

        var res = Array(repeating: Character("0"), count: count)
        res[res.count - 1] = "1"

        for i in 0..<(ones - 1) {
            res[i] = "1"
        }

        return String(res)
    }
}
