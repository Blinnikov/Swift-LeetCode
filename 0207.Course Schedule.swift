class Solution {
    private var seen = Set<Int>()
    private var adj = [[Int]]()
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        adj = Array(repeating: [Int](), count: numCourses)
        
        for p in prerequisites {
            if p[1] == p[0] {
                return false
            }
            adj[p[1]].append(p[0])
        }
        
        for course in 0..<adj.count {
            if !dfs(course) {
                return false
            }
        }
        
        return true
    }
    
    private func dfs(_ cur: Int) -> Bool {
        if seen.contains(cur) {
            return false
        }
        
        if adj[cur].isEmpty {
            return true
        }
        
        seen.insert(cur)
        for next in adj[cur] {
            if !dfs(next){
                return false
            }
        }
        adj[cur] = []
        seen.remove(cur)
        return true
    }
}
