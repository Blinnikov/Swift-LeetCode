class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        // bruteforce(matrix, k)
        let n = matrix.count
        var _min = matrix[0][0], _max = matrix[n-1][n-1]
        
        while _min != _max {
            var mid = _min + (_max - _min) / 2
            let count = count(matrix, mid)
            if count < k {
                _min = mid + 1
            } else {
                _max = mid
            }
        }
        
        return _min
        
    }
    
    private func count(_ matrix: [[Int]], _ mid: Int) -> Int {
        let n = matrix.count
        var res = 0
        var row = 0, col = n - 1
        
        while row < n && col >= 0 {
            if matrix[row][col] <= mid {
                res += (col + 1)
                row += 1
            } else {
                col -= 1
            }
        }
        
        return res
    }
    
    private func bruteforce(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        var arr = Array(repeating: 0, count: n*n)
        var index = 0
        
        for row in 0..<n {
            for col in 0..<n {
                arr[index] = matrix[row][col]
                index += 1
            }
        }
        
        arr.sort()
        
        return arr[k-1]
    }
}
