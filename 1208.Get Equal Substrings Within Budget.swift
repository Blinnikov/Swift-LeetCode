class Solution {
    private var s = [Character]()
    private var t = [Character]()

    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        self.s = Array(s)
        self.t = Array(t)

        var cost = 0
        var res = 0

        var lo = 0

        for hi in 0..<s.count {
            cost += diff(hi)

            while cost > maxCost {
                cost -= diff(lo)
                lo += 1
            }

            res = max(res, hi - lo + 1)
        }

        return res
    }

    private func diff(_ idx: Int) -> Int {
        abs(Int(s[idx].asciiValue!) - Int(t[idx].asciiValue!))
    }
}
