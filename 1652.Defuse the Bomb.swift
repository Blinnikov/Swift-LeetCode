class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        var res = Array(repeating: 0, count: code.count)

        if k == 0 {
            return res
        }

        for i in 0..<code.count {
            if k > 0 {
                for j in (i + 1)..<(i + k + 1) {
                    res[i] += code[j % code.count]
                }
            } else {
                for j in (i - abs(k))..<i {
                    res[i] += code[(j + code.count) % code.count]
                }
            }
        }

        return res
    }
}
