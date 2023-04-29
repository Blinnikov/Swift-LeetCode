class Solution {
    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var queries = queries
        var edgeList = edgeList
        var uf = UnionFind(n)
        var result = Array(repeating: false, count: queries.count)

        for i in 0..<queries.count {
            queries[i] = [queries[i][0], queries[i][1], queries[i][2], i]
        }

        queries.sort { $1[2] > $0[2] }
        edgeList.sort { $1[2] > $0[2] }

        // print(queries)
        // print(edgeList)

        var j = 0
        for i in 0..<queries.count {
            let query = queries[i]

            while j < edgeList.count, edgeList[j][2] < queries[i][2] {
                uf.union(edgeList[j][0], edgeList[j][1])
                j += 1
            }

            result[queries[i][3]] = uf.find(queries[i][0]) == uf.find(queries[i][1])
        }

        return result
    }
}

class UnionFind {
    private var id: [Int]

    init(_ n: Int) {
        self.id = Array(repeating: -1, count: n)

        for i in 0..<n {
            id[i] = i
        }
    }

    func find(_ x: Int) -> Int {
        if id[x] != x {
            id[x] = find(id[x])
        }

        return id[x]
    }

    func union(_ x: Int, _ y: Int) {
        id[find(x)] = id[find(y)]
    }
}
