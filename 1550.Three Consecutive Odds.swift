class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        if arr.count < 3 {
            return false
        }

        for i in 0...arr.count - 3 {
            if arr[i] & 1 == 1, arr[i + 1] & 1 == 1, arr[i + 2] & 1 == 1 {
                return true
            }
        }

        return false
    }
}
