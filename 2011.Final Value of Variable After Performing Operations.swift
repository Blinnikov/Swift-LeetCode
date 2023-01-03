class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var result = 0

        for op in operations {
            switch op {
                case "++X", "X++":
                result += 1
                case "--X", "X--":
                result -= 1
                default:
                fatalError()
            }
        }

        return result
    }
}
