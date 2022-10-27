class Solution {
    func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
        var res = 0
        
        for y in 0..<img1.count {
            for x in 0..<img1.count {
                res = max(res, shift(x, y, img1, img2))
                res = max(res, shift(x, y, img2, img1))
            }
        }
        
        return res
    }
    
    private func shift(_ x: Int, _ y: Int, _ one: [[Int]], _ two: [[Int]]) -> Int {
        var leftCount = 0, rightCount = 0
        var twoRow = 0
        
        for oneRow in y..<one.count {
            var twoCol = 0
            
            for oneCol in x..<one.count {
                if one[oneRow][oneCol] == 1, one[oneRow][oneCol] == two[twoRow][twoCol] {
                    leftCount += 1
                }
                if one[oneRow][twoCol] == 1, one[oneRow][twoCol] == two[twoRow][oneCol] {
                    rightCount += 1
                }
                twoCol += 1
            }
            
            twoRow += 1
        }
        
        return max(leftCount, rightCount)
    }
}
