class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        let n = rooms.count
        var seen = Array(repeating: false, count: n)
        seen[0] = true

        var stack = [Int]()
        stack.append(0)

        while !stack.isEmpty {
            let idx = stack.removeLast()
            for next in rooms[idx] {
                if !seen[next] {
                    seen[next] = true
                    stack.append(next)
                }
            }
        }

        return !seen.contains(false)
    }
}
