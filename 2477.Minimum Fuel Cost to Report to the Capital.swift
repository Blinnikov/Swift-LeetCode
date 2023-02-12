class Solution {
    private var fuel = 0
    private var adj = [Int:[Int]]()
    private var seats: Double = 0.0

    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        self.seats = Double(seats)

        for road in roads {
            let nodeFrom = road[0]
            let nodeTo = road[1]
            adj[nodeFrom, default: [Int]()].append(nodeTo)
            adj[nodeTo, default: [Int]()].append(nodeFrom)
        }

        traverse(0, -1)

        return fuel    
    }

    private func traverse(_ node: Int, _ parent: Int) -> Int {
        var reps = 1

        if let destinations = adj[node] {
            for city in destinations {
                if city != parent {
                    reps += traverse(city, node)
                }
            }

            if node != 0 {
                fuel += Int(ceil(Double(reps) / seats))
            }
        }

        return reps
    }
}
