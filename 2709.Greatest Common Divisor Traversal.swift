class Solution {
    private var idxToNum = [Int:[Int]]()
    private var numToIdx = [Int:[Int]]()

    func canTraverseAllPairs(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            var num = nums[i]

            var j = 2
            while (j * j) <= nums[i] {
                if num % j  == 0 {
                    numToIdx[j, default: [Int]()].append(i)
                    idxToNum[i, default: [Int]()].append(j)

                    while num % j == 0 {
                        num /= j
                    }
                }

                j += 1
            }

            if num > 1 {
                numToIdx[num, default: [Int]()].append(i)
                idxToNum[i, default: [Int]()].append(num)
            }
        }

        var visitedIdx = Array(repeating: false, count: nums.count)
        var visitedNum = [Int:Bool]()

        dfs(0, &visitedIdx, &visitedNum)

        for idx in visitedIdx {
            if !idx {
                return false
            }
        }

        return true
    }

    private func dfs(_ idx: Int, _ visitedIdx: inout [Bool], _ visitedNum: inout [Int:Bool]) {
        if visitedIdx[idx] {
            return
        }

        visitedIdx[idx] = true

        for n in idxToNum[idx] ?? [] {
            if visitedNum[n] ?? false {
                continue
            }

            visitedNum[n] = true

            for i in numToIdx[n] ?? [] {
                if visitedIdx[i] {
                    continue
                }

                dfs(i, &visitedIdx, &visitedNum)
            }
        }
    }
}
