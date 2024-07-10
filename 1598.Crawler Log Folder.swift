class Solution {
    func minOperations(_ logs: [String]) -> Int {
        var stack = [String]()

        for l in logs {
            if l == "./" {
                continue
            }

            if l == "../" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(l)
            }
        }

        return stack.count
    }
}
