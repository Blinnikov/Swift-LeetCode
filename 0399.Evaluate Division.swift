class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var graph = buildGraph(equations, values)
        print(graph)
        var res = Array(repeating: 0.0, count: queries.count)

        for i in 0..<queries.count {
            var _set = Set<String>()
            // print("Starting calculating res for \(queries[i][0]) and \(queries[i][1])")
            let v = pathWeight(queries[i][0], queries[i][1], graph, &_set)
            // print("Calculated res for \(queries[i][0]) and \(queries[i][1]) = \(v)")
            res[i] = v
            // print(res)
        }

        return res
    }

    private func buildGraph(_ equations: [[String]], _ values: [Double]) -> [String:[String:Double]] {
        var graph = [String:[String:Double]]()

        var a: String
        var b: String

        for i in 0..<equations.count {
            a = equations[i][0]
            b = equations[i][1]

            graph[a, default: [String:Double]()][b] = values[i]
            graph[b, default: [String:Double]()][a] = 1 / values[i]
        }

        return graph
    }

    private func pathWeight(_ s: String, _ e: String, _ graph: [String:[String:Double]], _ visited: inout Set<String>) -> Double {
        // print("Finding path for \(s) and \(e)")
        if graph[s] == nil {
            return -1.0
        }

        if graph[s]![e] != nil {
            return graph[s]![e]!
        }

        visited.insert(s)

        for (key, value) in graph[s]! {
            // print(key, value)
            if !visited.contains(key) {
                let weight = pathWeight(key, e, graph, &visited)
                if weight != -1.0 {
                    return value * weight
                }
            }
        }

        return -1.0
    }
}
