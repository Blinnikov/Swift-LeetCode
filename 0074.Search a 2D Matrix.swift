class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        var rowLo = 0, rowHi = m-1
        
        if m == 1 {
            return matrix[0].firstIndex(of: target) != nil
        }
        
        while rowLo < rowHi {
            let mid = rowLo + (rowHi-rowLo)/2
            
            if matrix[mid][0] == target || matrix[mid][n-1] == target {
                return true
            }
            
            if matrix[mid][0] < target && matrix[mid][n-1] > target {
                rowLo = mid
                rowHi = mid
                break
            }
            
            if matrix[mid][n-1] < target {
                rowLo = mid+1
            } else {
                rowHi = mid-1
            }
        }
        
        if rowHi < 0 {
            return false
        }
        
        return matrix[rowHi].firstIndex(of: target) != nil
        
        return false
    }
}
