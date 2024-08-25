class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var pq = PriorityQueue<Point> {
            $0.dist < $1.dist
        }

        var res = Array(repeating: [0, 0], count: k)

        for i in 0..<points.count {
            let p = points[i] 

            pq.enqueue(
                Point(x: p[0], y: p[1], dist: sqrt(Double(p[0] * p[0] + p[1] * p[1])))
            )
        }

        for i in 0..<k {
            let p = pq.dequeue()!

            res[i] = [p.x, p.y]
        }

        return res
    }
}
