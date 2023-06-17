class Solution {
    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let n = arr1.count 

        var arr1 = [Int.min] + arr1 + [Int.max]
        var arr2 = Set(arr2).sorted()

        // print(arr1, arr2)

        var dp = Array(repeating: Int.max, count: n + 2)
        dp[0] = 0

        for i in 1..<(n + 2) {
            for j in 0..<i {
                if arr1[j] < arr1[i], dp[j] != Int.max {
                    print("Start counting")
                    let changes = countChanges(arr1, arr2, j, i)
                    // print(changes)

                    if changes >= 0 {
                        dp[i] = min(dp[i], dp[j] + changes)
                    }
                }
            }
        }

        return dp[n + 1] == Int.max ? -1 : dp[n + 1]
    }

    private func countChanges(_ arr1: [Int], _ arr2: [Int], _ s: Int, _ e: Int) -> Int {
        if s + 1 == e {
            return 0
        }

        let _min = arr1[s]
        let _max = arr1[e]

        var idx = 0 
        print("Finding \(_min) in \(arr2)")
        // if let index = arr2.firstIndex(of: _min) {
        //     print(index)
        //     idx = index + 1
        //     // idx = index
        // }

        let index = arr2.binarySearch { $0 >= _min }
        print(index)
        idx = index + 1

        let maxCount = e - s - 1
        let endIdx = idx + maxCount - 1

        if endIdx < arr2.count, arr2[endIdx] < _max {
            return maxCount
        } else {
            return -1
        }
    }
}

extension RandomAccessCollection {
    /// Finds such index N that predicate is true for all elements up to
    /// but not including the index N, and is false for all elements
    /// starting with index N.
    /// Behavior is undefined if there is no such N.
    func binarySearch(predicate: (Element) -> Bool) -> Index {
        var low = startIndex
        var high = endIndex
        while low != high {
            let mid = index(low, offsetBy: distance(from: low, to: high)/2)
            if predicate(self[mid]) {
                low = index(after: mid)
            } else {
                high = mid
            }
        }
        return low
    }
}
