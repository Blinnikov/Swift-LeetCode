class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        if trust.count == 0 {
            if n == 1 {
                return 1
            }

            return -1
        }

        var trustTo = [Int:[Int]]()
        var trustMe = [Int:[Int]]()

        for t in trust {
            trustTo[t[0], default: [Int]()].append(t[1])
            trustMe[t[1], default: [Int]()].append(t[0])
        }

        for i in 1...n {
            if trustTo[i] == nil || trustTo[i]!.count == 0 {
                if trustMe[i] == nil || trustMe[i]!.count != n - 1 {
                    return -1
                }

                return i
            }
        }

        return -1
    }
}
