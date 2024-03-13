class Solution {
    func pivotInteger(_ n: Int) -> Int {
        let root = (Double(n * (n + 1)) / 2.0).squareRoot()

        if root.truncatingRemainder(dividingBy: 1.0) != 0 {
            return -1
        }

        return Int(root)
    }
}
