class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var map = [Int:Int]()

        for t in tasks {
            map[t, default: 0] += 1
        }

        print(map)

        var ans = 0

        for k in map.keys {
            let v = map[k]!
            if let r = rounds(for: v) {
                ans += r
            } else {
                return -1
            }
        }

        return ans
    }

    private func rounds(for value: Int) -> Int? {
        if value < 2 { 
            return nil
        }

        if value == 2 {
            return 1
        }

        if value == 4 {
            return 2
        }

        if value % 3 == 0 {
            return value / 3
        }

        if let r = rounds(for: value - 3) {
            return 1 + r
        }

        return nil
    }
}
