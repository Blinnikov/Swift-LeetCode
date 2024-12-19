class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var pref = arr
        var suff = arr

        for i in 1..<arr.count {
            pref[i] = max(pref[i - 1], pref[i])
        }

        for i in stride(from: arr.count - 2, through: 0, by: -1) {
            suff[i] = min(suff[i + 1], suff[i])
        }

        var res = 0

        for i in 0..<arr.count {
            if i == 0 || suff[i] > pref[i - 1] {
                res += 1
            }
        }

        return res
    }
}
