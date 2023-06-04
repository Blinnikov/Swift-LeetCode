class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        var uf = UnionFind(size: n)

        for i in 0..<n {
            for j in i+1..<n {
                if isConnected[i][j] == 1 {
                    uf.union(i,j)
                }
            }
        }

        return uf.numComponents
    }
}
