class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right

        var count = 0

        while l != r {
            l >>= 1
            r >>= 1
            count += 1
        }

        return l << count
    }
}
