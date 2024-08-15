class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0
        var ten = 0

        for b in bills {
            if b == 5 {
                five += 1
            } else if b == 10 {
                if five > 0 {
                    ten += 1
                    five -= 1
                } else {
                    return false
                }
            } else {
                if ten > 0, five > 0 {
                    ten -= 1
                    five -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }

        return true
    }
}
