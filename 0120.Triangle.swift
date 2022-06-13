class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0][0]
        }

        var triangle = triangle
        for level in stride(from: triangle.count-2, through: 0, by: -1) { // start from the level before last one
            for i in 0..<triangle[level].count {
                triangle[level][i] += min(triangle[level+1][i], triangle[level+1][i+1])
            }
        }
        
        return triangle[0][0]
    }
}
