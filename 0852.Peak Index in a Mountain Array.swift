class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        arr.firstIndex(of: arr.max()!)!
    }
}
