class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        arr.firstIndex(of: arr.max()!)!
    }

    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var lo = 0
        var hi = arr.count - 1

        while lo < hi {
            let mid = (lo + hi) / 2

            if arr[mid] < arr[mid + 1] {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo
    }
}
