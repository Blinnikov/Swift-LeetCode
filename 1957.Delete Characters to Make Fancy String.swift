class Solution {
    func makeFancyString(_ s: String) -> String {
        if s.count < 3 {
            return s
        }

        let chars = Array(s)

        var res = [Character]()
        res.reserveCapacity(chars.count)

        res.append(chars[0])
        res.append(chars[1])

        for i in 2..<chars.count {
            if chars[i] != res[res.count - 1] || chars[i] != res[res.count - 2] {
                res.append(chars[i])
            }
        }

        return String(res)
    }
}
