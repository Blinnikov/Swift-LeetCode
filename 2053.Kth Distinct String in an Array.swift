class Solution {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var map = [String:Int]()

        for s in arr {
            map[s, default: 0] += 1
        }

        var idx = 0

        for s in arr {
            if map[s] == 1 {
                idx += 1
            }

            if idx == k {
                return s
            }
        }

        return ""
    }
}
