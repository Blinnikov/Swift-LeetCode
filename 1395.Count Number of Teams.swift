class Solution {
    // brute
    func numTeams(_ rating: [Int]) -> Int {
        var inc = 0
        var dec = 0

        for mid in 0..<rating.count {
            var lt = 0
            var gt = 0

            for left in stride(from: mid - 1, through: 0, by: -1) {
                if rating[left] < rating[mid] {
                    lt += 1
                }
            }

            for right in stride(from: mid + 1, to: rating.count, by: 1) {
                if rating[mid] < rating[right] {
                    gt += 1
                }
            }

            inc += lt * gt
        }

        for mid in 0..<rating.count {
            var lt = 0
            var gt = 0

            for left in stride(from: mid - 1, through: 0, by: -1) {
                if rating[left] > rating[mid] {
                    gt += 1
                }
            }

            for right in stride(from: mid + 1, to: rating.count, by: 1) {
                if rating[mid] > rating[right] {
                    lt += 1
                }
            }

            dec += lt * gt
        }

        return inc + dec
    }
}
