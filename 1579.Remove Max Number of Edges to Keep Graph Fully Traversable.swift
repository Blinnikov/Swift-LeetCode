class Solution {
    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        var totalEdges = edges
        var requiredEdges = 0

        totalEdges.sort { $0[0] > $1[0] }

        var alice = UnionFind(n)
        var bob = UnionFind(n)

        for e in totalEdges {
            switch e[0] {
                case 3:
                    let aliceUnion = alice.union(e[1], e[2])
                    let bobUnion = bob.union(e[1], e[2])
                    if aliceUnion || bobUnion {
                        requiredEdges += 1
                    }
                    break;
                case 2:
                    if bob.union(e[1], e[2]) {
                        requiredEdges += 1
                    }
                    break;
                case 1:
                    if alice.union(e[1], e[2]) {
                        requiredEdges += 1
                    }
                    break;
                default:
                    break;
            }
        }

        return alice.numComponents == 1 && bob.numComponents == 1 
                ? totalEdges.count - requiredEdges 
                : -1
    }
}

class UnionFind {
    private var id: [Int]
    private (set) var numComponents = 0

    init(_ n: Int) {
        self.id = Array(repeating: -1, count: n + 1)

        for i in 0...n {
            id[i] = i
        }

        numComponents = n
    }

    func find(_ x: Int) -> Int {
        if id[x] != x {
            id[x] = find(id[x])
        }

        return id[x]
    }

    func union(_ x: Int, _ y: Int) -> Bool {
        if find(x) != find(y) {
            id[find(x)] = y
            numComponents -= 1
            return true
        }

        return false
    }
}
