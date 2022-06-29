class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        for el in people.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] } {
            result.insert(el, at: el[1])
        }
        
        return result
    }
}
