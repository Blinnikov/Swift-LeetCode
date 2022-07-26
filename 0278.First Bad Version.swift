/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var lo = 1, hi = n
        while(lo < hi) {
            let mid = lo + (hi-lo)/2
            if isBadVersion(mid) {
                hi = mid
            } else {
                lo = mid+1
            }
        }
        
        return hi
    }
}
