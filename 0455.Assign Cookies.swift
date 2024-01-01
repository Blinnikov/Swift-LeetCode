class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var g = g.sorted()
        var s = s.sorted()

        var gIdx = g.count - 1
        var sIdx = s.count - 1

        var res = 0

        while gIdx >= 0, sIdx >= 0 {
            if s[sIdx] >= g[gIdx] {
                res += 1
                gIdx -= 1
                sIdx -= 1
            } else {
                gIdx -= 1
            }
        }

        return res
    }
}
