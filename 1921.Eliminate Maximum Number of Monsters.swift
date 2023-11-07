class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        var arrival = Array(repeating: 0.0, count: dist.count)

        for i in 0..<dist.count {
            arrival[i] = Double(dist[i]) / Double(speed[i])
        }

        arrival.sort()

        print(arrival)

        var res = 0

        for i in 0..<arrival.count {
            if arrival[i] <= Double(i) {
                return res
            }

            res += 1
        }

        return res
    }
}
