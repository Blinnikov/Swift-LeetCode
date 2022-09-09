class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        var properties = properties.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] }
        var weak = 0, defense = 0
        
        for p in properties {
            let sample = p[1]
            
            if p[1] < defense {
                weak += 1
            }
            
            defense = max(defense, p[1])
        }
        
        return weak
    }
}
