class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var mins = Array(repeating: 0, count: timePoints.count)

        for i in 0..<timePoints.count {
            let chars = Array(timePoints[i])
            let h = Int(String(chars[0..<2]))!
            let m = Int(String(chars[3...4]))!
            
            mins[i] = 60 * h + m
        }

        mins.sort()

        var res = Int.max

        for i in 0..<mins.count - 1 {
            res = min(res, mins[i + 1] - mins[i])
        }

        return min(res, 24 * 60 - mins.last! + mins[0])
    }
}
