class Solution {
    func minimumDeletions(_ s: String) -> Int {
        var res = Int.max
        let chars = Array(s)

        var a = 0

        for ch in chars {
            if ch == "a" {
                a += 1
            }
        }

        var b = 0

        for ch in chars {
            if ch == "a" {
                a -= 1
            }

            res = min(res, a + b)

            if ch == "b" {
                b += 1
            }
        }

        return res
    }
}
