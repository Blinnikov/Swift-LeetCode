class Solution {
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        let rows = mat.count
        let cols = mat[0].count

        var map = [Int:(Int,Int)]()

        var rCount = Array(repeating: 0, count: rows)
        var cCount = Array(repeating: 0, count: cols)

        for r in 0..<rows {
            for c in 0..<cols {
                map[mat[r][c]] = (r, c)
            }
        }

        for i in 0..<arr.count {
            let (r, c) = map[arr[i]]!

            rCount[r] += 1
            cCount[c] += 1

            if rCount[r] == cols || cCount[c] == rows {
                return i
            }
        }

        return -1
    }
}
