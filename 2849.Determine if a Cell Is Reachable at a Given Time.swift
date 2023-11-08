class Solution {
    func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        var dist = max(abs(fx - sx), abs(fy - sy))

        return dist > 0 ? t >= dist : t != 1
    }
}
