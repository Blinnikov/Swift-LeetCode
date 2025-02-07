class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var colors = [Int:Int]()
        var balls = [Int:Int]()

        var res = Array(repeating: 0, count: queries.count)

        for i in 0..<queries.count {
            let b = queries[i][0]
            let c = queries[i][1]

            if let color = balls[b] {
                colors[color, default: 0] -= 1

                if colors[color] == 0 {
                    colors[color] = nil
                }
            }

            balls[b] = c
            colors[c, default: 0] += 1

            res[i] = colors.count
        }

        return res
    }
}
