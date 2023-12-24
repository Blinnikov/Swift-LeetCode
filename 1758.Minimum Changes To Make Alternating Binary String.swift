class Solution {
    func minOperations(_ s: String) -> Int {
        let chars = Array(s)

        var startsWithZero = 0
        var startsWitnOne = 0

        for i in 0..<chars.count {
            if i & 1 == 0 {
                if chars[i] == "0" {
                    startsWitnOne += 1
                } else {
                    startsWithZero += 1
                }
            } else {
                if chars[i] == "0" {
                    startsWithZero += 1
                } else {
                    startsWitnOne += 1
                }
            }
        }

        return min(startsWithZero, startsWitnOne)
    }
}
