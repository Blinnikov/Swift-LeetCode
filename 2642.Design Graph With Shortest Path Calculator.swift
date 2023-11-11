
class Graph {
    private var adj: [[Pair]]

    init(_ n: Int, _ edges: [[Int]]) {
        adj = Array(repeating: [Pair](), count: n)

        for e in edges {
            adj[e[0]].append(Pair(to: e[1], cost: e[2]))
        }
    }
    
    func addEdge(_ edge: [Int]) {
        adj[edge[0]].append(Pair(to: edge[1], cost: edge[2]))
    }
    
    func shortestPath(_ node1: Int, _ node2: Int) -> Int {
        let n = adj.count

        var pq = PriorityQueue<Pair>(sort: { $0.cost < $1.cost })

        var dist = Array(repeating: Int.max, count: adj.count)
        dist[node1] = 0

        pq.enqueue(Pair(to: node1, cost: 0))

        while !pq.isEmpty {
            let p = pq.dequeue()!
            
            if p.to == node2 {
                return p.cost
            }

            for neigbour in adj[p.to] {
                let cost = p.cost + neigbour.cost

                if cost < dist[neigbour.to] {
                    dist[neigbour.to] = cost
                    pq.enqueue(Pair(to: neigbour.to, cost: cost))
                }
            }
        }

        return -1
    }
}

/**
 * Your Graph object will be instantiated and called as such:
 * let obj = Graph(n, edges)
 * obj.addEdge(edge)
 * let ret_2: Int = obj.shortestPath(node1, node2)
 */

 struct Pair : Equatable {
     var to: Int
     var cost: Int
 }
