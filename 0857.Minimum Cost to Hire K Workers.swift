class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        var workers = Array(repeating: (ratio: 0.0, quality: 0), count: quality.count)

        for i in 0..<workers.count {
            workers[i] = (Double(wage[i]) / Double(quality[i]), quality[i])
        }

        workers.sort { $0.ratio < $1.ratio }

        var res = Double.greatestFiniteMagnitude
        var sum = 0

        var pq = PriorityQueue<Int> { $0 > $1 }

        for w in workers {
            sum += w.quality
            
            pq.enqueue(w.quality)

            if pq.count > k {
                sum -= pq.dequeue()!
            }

            if pq.count == k {
                res = min(res, Double(sum) * w.ratio)
            }
        }

        return res
    }
}
