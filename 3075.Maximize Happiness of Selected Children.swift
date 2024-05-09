class Solution {
    func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
        var k = k
        var h = happiness.sorted { $0 > $1 }

        var step = 0
        var res = 0

        while k > 0 {
            res += max(h[step] - step, 0)
            
            step += 1
            k -= 1
        }

        return res
    }
}
