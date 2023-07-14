class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var res = 1
        var map = [Int:Int]()

        for i in 0..<arr.count {
            map[arr[i]] = map[arr[i] - difference, default: 0] + 1
            res = max(res, map[arr[i]]!)
        }

        return res
    }
}
