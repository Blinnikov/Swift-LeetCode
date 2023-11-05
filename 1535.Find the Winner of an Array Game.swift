class Solution {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        var curr = arr[0]
        var win = 0

        for i in 1..<arr.count {
            if arr[i] > curr {
                curr = arr[i]
                win = 0
            }

            win += 1

            if win == k {
                break
            }
        }

        return curr
    }
}
