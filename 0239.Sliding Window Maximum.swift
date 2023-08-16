class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count

        var res = Array(repeating: 0, count: n - k + 1)

        var window = [Int]()

        for i in 0..<n {
            while window.count > 0, window.first! <= i - k {
                window.removeFirst()
            }

            while !window.isEmpty, nums[window.last!] < nums[i] {
                window.removeLast()
            }

            window.append(i)

            if i >= k - 1 {
                res[i - k + 1] = nums[window.first!]
            }
        }

        return res
    }
}
