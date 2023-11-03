class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var idx = 0
        var num = 1
        var result = [String]()

        while idx < target.count, num <= n {
            result.append("Push")

            if target[idx] == num {
                idx += 1
            } else {
                result.append("Pop")
            }

            num += 1
        }

        return result
    }
}
