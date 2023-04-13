class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int]()
        var idx = 0

        for num in pushed {
            stack.append(num)

            while !stack.isEmpty, stack.last! == popped[idx] {
                stack.removeLast()
                idx += 1
            }
        }

        // print(stack)
        // print(idx)

        return idx == pushed.count
    }
}
