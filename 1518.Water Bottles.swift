class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var res = numBottles
        var rest = numBottles

        while rest >= numExchange {
            res += rest / numExchange
            rest = (rest / numExchange) + (rest % numExchange)
        }

        return res
    }
}
