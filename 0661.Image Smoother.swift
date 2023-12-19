class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        var img = img
        var result = img

        for row in 0..<img.count {
            for col in 0..<img[0].count {
                result[row][col] = round(row, col, &img)
            }
        }

        return result
    }

    private func round(_ row: Int, _ col: Int, _ img: inout [[Int]]) -> Int {
        var sum = 0
        var count = 0

        for rowOffset in -1...1 {
            for colOffset in -1...1 {
                let r = row + rowOffset
                let c = col + colOffset
                
                if r < 0 || r >= img.count || c < 0 || c >= img[0].count {
                    continue
                }

                sum += img[r][c]
                count += 1
            }
        }

        return Int(floor(Double(sum) / Double(count)))
    }
}
