class Solution {
    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let m = box.count
        let n = box[0].count

        var res = Array(repeating: Array(repeating: Character("."), count: m), count: n)

        for i in 0..<n {
            for j in 0..<m {
                res[i][j] = box[j][i]
            }

            res[i].reverse()
        }

        for j in 0..<m {
            for i in stride(from: n - 1, through: 0, by: -1) {
                if res[i][j] != "." {
                    continue
                }

                var nextRow = -1

                for k in stride(from: i - 1, through: 0, by: -1) {
                    if res[k][j] == "*" {
                        break
                    }

                    if res[k][j] == "#" {
                        nextRow = k
                        break
                    }
                }

                if nextRow != -1 {
                    res[nextRow][j] = "."
                    res[i][j] = "#"
                }
            }
        }

        return res
    }
}
