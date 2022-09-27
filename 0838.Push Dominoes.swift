class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var d = Array(dominoes)
        let count = d.count
        
        var forces = Array(repeating: 0, count: count)
        
        var force = 0
        for i in 0..<count {
            if d[i] == "R" {
                force = count
            } else if d[i] == "L" {
                force = 0
            } else {
                force = max(force-1, 0)
            }
            
            forces[i] += force
        }
        
        force = 0
        for i in stride(from: count-1, through: 0, by: -1) {
            if d[i] == "L" {
                force = count
            } else if d[i] == "R" {
                force = 0
            } else {
                force = max(force-1, 0)
            }
            
            forces[i] -= force
        }
        
        for i in 0..<count {
            if forces[i] > 0 {
                d[i] = "R"
            } else if forces[i] < 0 {
                d[i] = "L"
            } else {
                d[i] = "."
            }
        }
        
        return String(d)
    }
}
