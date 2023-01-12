class Solution {

    private var ans = [Int]()
    private var chars = [Character]()
    private var adj = [Int:Set<Int>]()

    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        ans = Array(repeating: 0, count: n)
        chars = Array(labels)

        for e in edges {
            let a = e[0], b = e[1]
            adj[a, default: []].insert(b)
            adj[b, default: []].insert(a)
        }

        traverse(0, -1)
        return ans
    }

    private func traverse(_ node: Int, _ parent: Int) -> [Character:Int] {
        var nodeMap = [chars[node]:1]
        if let children = adj[node] {
            for child in children {
                if child == parent {
                    continue
                }
                let childMap = traverse(child, node)
                for k in childMap.keys {
                    nodeMap[k, default:0] += childMap[k]!
                }
            }
        }

        ans[node] = nodeMap[chars[node]]!

        return nodeMap
    }
}
