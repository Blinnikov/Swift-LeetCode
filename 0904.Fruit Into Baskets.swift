class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var basket = [Int:Int]()
        var lo = 0
        var res = 0

        for hi in 0..<fruits.count {
            basket[fruits[hi], default: 0] += 1

            while (basket.keys.count > 2) {
                basket[fruits[lo], default: 0] -= 1
                if basket[fruits[lo]] == 0 {
                    basket[fruits[lo]] = nil
                }
                lo += 1
            }
            
            res = max(res, hi - lo + 1)
        }

        return res
    }
}
