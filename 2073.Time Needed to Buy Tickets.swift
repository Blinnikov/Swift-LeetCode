class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var res = 0

        for i in 0..<tickets.count {
            if i <= k {
                res += min(tickets[i], tickets[k])
            } else {
                res += min(tickets[i], tickets[k] - 1)
            }
        }

        return res
    }
}
