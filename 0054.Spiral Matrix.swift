class Solution {
    private var matrix: [[Int]] = []
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        self.matrix = matrix
        let rows = matrix.count
        let cols = matrix[0].count
        var result: [Int] = []
        
        var minCol = 0, maxCol = cols-1
        var minRow = 0, maxRow = rows-1
        
        var itemsLeft = rows * cols
        
        while itemsLeft > 0 {
            var subRes = travel(true, minRow, minCol, maxCol)
            result += subRes
            itemsLeft -= subRes.count
            minRow += 1

            if itemsLeft <= 0 {
                break
            }
        
            subRes = travel(false, maxCol, minRow, maxRow)
            result += subRes
            itemsLeft -= subRes.count
            maxCol -= 1

            if itemsLeft <= 0 {
                break
            }
        
            subRes = travel(true, maxRow, maxCol, minCol)
            result += subRes
            itemsLeft -= subRes.count
            maxRow -= 1

            if itemsLeft <= 0 {
                break
            }
        
            subRes = travel(false, minCol, maxRow, minRow)
            result += subRes
            itemsLeft -= subRes.count
            minCol += 1

            if itemsLeft <= 0 {
                break
            }
        }
        
        return result
    }
    
    private func travel(_ row: Bool, _ num: Int, _ from: Int, _ to: Int) -> [Int] {
        var result: [Int] = []
        result.reserveCapacity(abs(from - to) + 1)

        let direction = from <= to ? 1 : -1
        
        for i in stride(from: from, through: to, by: direction) {
            let item = row ? matrix[num][i] : matrix[i][num]
            result.append(item)
        }
        
        return result
    }
}
