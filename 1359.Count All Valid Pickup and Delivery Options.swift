class Solution {
    private let mod = 1_000_000_007

    func countOrders(_ n: Int) -> Int {
        var res = 1

        for i in 1...n {
            let pickup = i 
            let delivery = 2 * i - 1
            let count = pickup * delivery

            res = res * count % mod
        }

        return res
    }
}
