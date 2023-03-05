class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count

        if n == 1 {
            return 0
        }
        
        var indicesMap = [Int:[Int]]()
        for i in 0..<n {
            indicesMap[arr[i], default: [Int]()].append(i)
        }

        var queue = [Int]()
        queue.append(0)

        var steps = 0
        while !queue.isEmpty {
            steps += 1

            var count = queue.count
            while count > 0 {
                let idx = queue.removeLast()

                if idx - 1 > 0, indicesMap[arr[idx - 1]] != nil {
                    queue.insert(idx - 1, at: 0)
                }

                if idx + 1 < n, indicesMap[arr[idx + 1]] != nil {
                    if idx + 1 == n - 1 {
                        return steps
                    }

                    queue.insert(idx + 1, at: 0)
                }

                if let jumps = indicesMap[arr[idx]] {
                    for jumpIdx in jumps {
                        if jumpIdx != idx {
                            if jumpIdx == n - 1 {
                                return steps
                            }

                            queue.insert(jumpIdx, at: 0)
                        }
                    }

                    indicesMap[arr[idx]] = nil
                }

                count -= 1
            }
        }

        return steps
    }
}
