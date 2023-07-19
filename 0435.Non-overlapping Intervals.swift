class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var all = intervals.sorted { $0[1] < $1[1] }

        var lastEnd = all[0][1]

        var consecutive = 1

        for i in 1..<all.count {
            if all[i][0] >= lastEnd {
                consecutive += 1
                lastEnd = all[i][1]
            }
        }

        return all.count - consecutive
    }
}
