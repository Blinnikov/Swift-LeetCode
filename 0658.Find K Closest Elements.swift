class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var lo = 0, hi = arr.count-1
        while hi - lo >= k {
            if abs(arr[lo] - x) > abs(arr[hi] - x) {
                lo += 1
            } else {
                hi -= 1
            }
        }
        
        return Array(arr[lo...hi])
    }
}
