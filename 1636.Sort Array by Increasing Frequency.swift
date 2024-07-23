class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var freq = [Int:Int]()

        for n in nums {
            freq[n, default: 0] += 1
        }

        return nums.sorted {
            freq[$0] == freq[$1] ? $1 < $0 : freq[$0]! < freq[$1]!
        }
    }
}
