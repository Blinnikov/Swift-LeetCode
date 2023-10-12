/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */

class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let n = mountainArr.length()

        var peak = 0

        var lo = 0
        var hi = n - 1

        while lo < hi {
            let mid = (lo + hi) / 2

            if mountainArr.get(mid) < mountainArr.get(mid + 1) {
                peak = mid + 1
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        lo = 0
        hi = peak

        while lo <= hi {
            let mid = (lo + hi) / 2
            let midVal = mountainArr.get(mid)

            if midVal == target {
                return mid
            }

            if midVal < target {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }

        lo = peak
        hi = n - 1

        while lo <= hi {
            let mid = (lo + hi) / 2
            let midVal = mountainArr.get(mid)

            if midVal == target {
                return mid
            }

            if midVal > target {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }

        return -1
    }
}
