class Solution {
    func maxDepth(_ s: String) -> Int {
        let chars = Array(s)

        var res = 0
        var count = 0

        for ch in chars {
            if ch == "(" {
                count += 1
                res = max(res, count)
            } else if ch == ")" {
                count -= 1
            }
        }

        return res
    }
}
