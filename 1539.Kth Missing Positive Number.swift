class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var lo = 0
        var hi = arr.count

        while lo < hi {
            let mid = (lo + hi) / 2

            if arr[mid] - 1 - mid < k {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo + k
     }

    func findKthPositive_On(_ arr: [Int], _ k: Int) -> Int {
        var set = Set(arr)

        var idx = 0
        for num in 1...10_000 {
            if !set.contains(num) {
                idx += 1
            }

            if k == idx {
                return num
            } 
        }

        return -1
    }
}
