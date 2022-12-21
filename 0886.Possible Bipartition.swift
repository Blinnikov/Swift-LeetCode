class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var adj = [Int: [Int]]()
        for link in dislikes {
            let a = link[0]
            let b = link[1]
            adj[a, default: [Int]()].append(b)
            adj[b, default: [Int]()].append(a)
        }

        var characters = Array(repeating: Character.unassigned, count: n + 1)

        for i in 1...n {
            if characters[i] == .unassigned {
                if !dfs(i, .hero, adj, &characters) {
                    return false
                }
            }
        }

        return true
    }

    private func dfs(_ idx: Int, _ ch: Character, _ adj: [Int:[Int]], _ chars: inout[Character]) -> Bool {
        chars[idx] = ch

        if adj[idx] == nil {
            return true
        }

        for next in adj[idx]! {
            if chars[next] == chars[idx] {
                return false
            }
            if chars[next] == .unassigned {
                if !dfs(next, ch.alternative, adj, &chars) {
                    return false
                }
            }
        }

        return true
    }
}

enum Character {
    case unassigned
    case hero
    case villain

    var alternative : Character {
        self == .hero ? .villain : .hero
    }
}
