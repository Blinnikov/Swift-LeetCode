class Solution {
    private let nonExist = -100001

    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var map = [Int:[Int]]()

        for pair in adjacentPairs {
            let left = pair[0]
            let right = pair[1]

            map[left, default: [Int]()].append(right)
            map[right, default: [Int]()].append(left)
        }

        var end = nonExist

        for (k, v) in map {
            if v.count == 1 {
                end = k
                break
            }
        }

        var result = Array(repeating: 0, count: adjacentPairs.count + 1)
        var i = 0
        var prev = nonExist

        result[i] = end

        while i < result.count - 1 {
            var next = map[result[i]]!
            map[result[i]] = nil

            for n in next {
                if prev == nonExist || prev != n {
                    prev = result[i]
                    i += 1
                    result[i] = n
                    break
                }
            }
        }

        return result
    }
}
