class Solution {
    func scoreOfString(_ s: String) -> Int {
        let chars = Array(s)
        var res = 0

        for i in 1..<chars.count {
            res += abs(Int(chars[i].asciiValue!) - Int(chars[i - 1].asciiValue!))
        }

        return res
    }
}
