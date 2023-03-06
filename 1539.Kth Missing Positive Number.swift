class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var set = Set(arr)

        var idx = 0
        for num in 1...10_000 {
            if !set.contains(num) {
                idx += 1
            }

            if k == idx {
                return num
            } 
        }

        return -1
    }
}
