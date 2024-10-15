class Solution {
    func minimumSteps(_ s: String) -> Int {
        var black = 0
        var res = 0

        for ch in s {
            if ch == "0" {
                res += black
            } else {
                black += 1
            }
        }

        return res
    }
}
