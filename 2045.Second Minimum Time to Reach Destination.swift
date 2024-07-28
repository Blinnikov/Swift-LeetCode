class Solution {
    func secondMinimum(_ n: Int, _ edges: [[Int]], _ time: Int, _ change: Int) -> Int {
        var adj = [Int:[Int]]()

        for e in edges {
            let from = e[0]
            let to = e[1]

            adj[from, default: [Int]()].append(to)
            adj[to, default: [Int]()].append(from)
        }

        var pq = PriorityQueue<Node>(sort: {
            $0.distance < $1.distance
        })

        pq.enqueue(Node(distance: 0, index: 1))

        var dist1 = Array(repeating: Int.max, count: n + 1)
        var dist2 = Array(repeating: Int.max, count: n + 1)
        var freq = Array(repeating: 0, count: n + 1)

        dist1[1] = 0

        while !pq.isEmpty {
            let node = pq.dequeue()!
            var dist = node.distance

            freq[node.index] += 1

            let isRed = (dist / change) & 1 == 1

            dist = isRed
                ? change * ((dist / change) + 1) + time 
                : dist + time

            for next in adj[node.index]! {
                if freq[next] == 2 {
                    continue
                }

                if dist1[next] > dist {
                    dist2[next] = dist1[next]
                    dist1[next] = dist
                    
                    pq.enqueue(Node(distance: dist, index: next))
                } else if dist2[next] > dist, dist1[next] != dist {
                    dist2[next] = dist
                    
                    pq.enqueue(Node(distance: dist, index: next))
                }
            }
        }

        return dist2[n] == Int.max ? 0 : dist2[n]
    }
}

struct Node : Equatable {
    var distance: Int
    var index: Int
}
