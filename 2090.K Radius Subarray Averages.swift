class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        var res = Array(repeating: -1, count: nums.count)

        if k > (nums.count - 1) / 2 {
            return res
        }

        let centerLo = k
        let centerHi = nums.count - k
        let len = 2 * k + 1

        var segmentSum = 0

        for i in centerLo..<centerHi {
            print("i = \(i)")
            if i == centerLo {
                segmentSum = sum(of: nums, from: i - k, to: i + k)
            } else {
                let lo = i - k - 1
                let hi = i + k

                segmentSum -= nums[lo]
                segmentSum += nums[hi]
            }

            res[i] = segmentSum / len
        }

        return res
    }

    private func sum(of arr: [Int], from: Int, to: Int) -> Int {
        if from == to {
            return arr[to]
        }

        var res = 0

        for i in from...to {
            res += arr[i]
        }

        return res
    }
}
