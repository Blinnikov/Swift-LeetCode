// TLE 32/35
class Solution {
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        var projects = [(profit: Int, capital: Int, id: Int)]()
        for i in 0..<profits.count {
            projects.append((profits[i], capital[i], i))
        }

        var usedProjects = Set<Int>()
        var k = k, w = w
        while k > 0 {
            var suitableProjects = projects.filter { $0.capital <= w && !usedProjects.contains($0.id) }
            // print(suitableProjects)
            if suitableProjects.count == 0 {
                return w
            }

            var maxProject = suitableProjects.max { $0.profit < $1.profit }!
            w += maxProject.profit
            usedProjects.insert(maxProject.id)

            k -= 1
        }

        return w
    }
}
