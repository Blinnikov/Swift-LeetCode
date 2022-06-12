class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adj = fillAdjacencyList(times)
        var pq = PQ<Int>()
        var distance = Array(repeating: Int.max, count: n+1)
        distance[k] = 0
        pq.enqueue(k, with: 0)
        
        while !pq.isEmpty {
            var (node, time) = pq.dequeue()
            
            if distance[node] < time {
                continue
            }
            
            if adj[node] == nil {
                continue
            }
            
            for (t, n) in adj[node]! {
                if distance[node] + t < distance[n] {
                    distance[n] = distance[node] + t
                    pq.enqueue(n, with: distance[n])
                }
            }
        }
        
        var result = Int.min
        for i in 1...n {
            if distance[i] == Int.max {
                return -1
            }
            
            if distance[i] > result {
                result = distance[i]
            }
        }
        
        
        return result
    }
    
    private func fillAdjacencyList(_ times: [[Int]]) -> [Int:[(Int,Int)]] {
        var list = [Int:[(Int,Int)]]()
        
        for edge in times {
            let source = edge[0]
            let dest = edge[1]
            let time = edge[2]
            
            if list[source] == nil {
                list[source] = [(Int,Int)]()
            }
            list[source]!.append((time, dest))
        }
        
        return list
    }
}

class PQ<TItem> {
    private var priorities: [Int]
    private var items: [TItem]
    
    init() {
        self.priorities = [Int]()
        self.items = [TItem]()
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    func enqueue(_ item: TItem, with priority: Int) {
        priorities.append(priority)
        items.append(item)
    }
    
    func dequeue() -> (TItem, Int) {
        let minPr = priorities.min()!
        let idx = priorities.firstIndex(of: minPr)!
        
        let item = items.remove(at: idx)
        let priority = priorities.remove(at: idx)
        
        return (item, priority)
    }
}
