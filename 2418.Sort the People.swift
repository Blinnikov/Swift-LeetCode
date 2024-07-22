class Solution {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        var pairs = Array(repeating: (name: "", height: 0), count: names.count)

        for i in 0..<names.count {
            pairs[i] = (names[i], heights[i])
        }

        return pairs.sorted {
            $0.height > $1.height
        }.map {
            $0.name
        }
    }
}
