class Solution {
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: obstacles.count)
        var stack = Array(repeating: 0, count: obstacles.count)

        var len = 0

        for i in 0..<obstacles.count {
            var lo = 0
            var hi = len

            while lo < hi {
                let mid = (lo + hi) / 2
                if stack[mid] <= obstacles[i] {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }

            res [i] = lo + 1

            if len == lo {
                len += 1
            }

            stack[lo] = obstacles[i]
        }

        return res
    }
}
