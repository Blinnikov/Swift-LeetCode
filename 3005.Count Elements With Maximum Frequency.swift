class Solution {
    func maxFrequencyElements(_ nums: [Int]) -> Int {
        var map = [Int:Int]()

        for n in nums {
            map[n, default: 0] += 1
        }

        let freqs = map.values.sorted()

        var ptr = freqs.count - 1
        var res = freqs[ptr]

        while ptr >= 1, freqs[ptr - 1] == freqs[ptr] {
            res += freqs[ptr - 1]
            ptr -= 1
        }

        return res
    }
}
