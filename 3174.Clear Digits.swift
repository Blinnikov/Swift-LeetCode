class Solution {
    func clearDigits(_ s: String) -> String {
        var chars = Array(s)
        var res = [Character]()

        for ch in chars {
            if ch.isNumber, !res.isEmpty {
                res.removeLast()
            } else {
                res.append(ch)
            }
        }

        return String(res)
    }
}
