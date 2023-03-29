class Solution {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let s = satisfaction.sorted()
        
        var total = 0
        var res = 0

        var i = s.count - 1
        while i >= 0 && s[i] > -1 * total {
            total += s[i]
            res += total

            i -= 1
        }

        return res
    }
}
