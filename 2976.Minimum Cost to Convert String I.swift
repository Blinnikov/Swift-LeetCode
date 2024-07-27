class Solution {
    private let a = Character("a").asciiValue!

    func minimumCost(_ source: String, _ target: String, _ original: [Character], _ changed: [Character], _ cost: [Int]) -> Int {
        let source = Array(source)
        let target = Array(target)

        var graph = Array(repeating: Array(repeating: Int.max, count: 26), count: 26)

        for i in 0..<26 {
            graph[i][i] = 0
        }

        for i in 0..<cost.count {
            let from = charToInt(original[i])
            let to = charToInt(changed[i])

            graph[from][to] = min(graph[from][to], cost[i])
        }

        for to in 0..<26 {
            for from in 0..<26 {
                if graph[from][to] == Int.max {
                    continue
                }

                for idx in 0..<26 {
                    if graph[to][idx] == Int.max {
                        continue
                    }

                    graph[from][idx] = min(graph[from][idx], graph[from][to] + graph[to][idx])
                }
            }
        }

        var res = 0

        for i in 0..<source.count {
            let from = charToInt(source[i])
            let to = charToInt(target[i])

            let minCost = graph[from][to]

            if minCost == Int.max {
                return -1
            }

            res += minCost
        }

        return res
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue! - a)
    }
}
