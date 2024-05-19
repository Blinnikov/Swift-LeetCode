class Solution {
    func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
        var sum = 0
        var count = 0
        var minNode = Int.max

        for n in nums {
            sum += max(n, n ^ k)
            count ^= (n < (n ^ k) ? 1 : 0)
            minNode = min(minNode, abs(n - (n ^ k)))
        }

        return sum - minNode * count
    }
}
