class Solution {
    func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
        var roadsCount = Array(repeating: 0, count: n)

        for road in roads {
            let from = road[0]
            let to = road[1]

            roadsCount[from] += 1
            roadsCount[to] += 1
        }

        var cities = Array(0..<n)

        cities.sort { roadsCount[$0] > roadsCount[$1] }

        var res = 0

        for city in cities {
            let cityNum = n - city
            let roadsCountForCity = roadsCount[cities[city]]

            res += cityNum * roadsCountForCity
        }

        return res
    }
}
