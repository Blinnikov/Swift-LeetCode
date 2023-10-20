
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {
    private var stack = [NestedInteger]()

    init(_ nestedList: [NestedInteger]) {
        fillStack(nestedList)
        print(stack)
    }
    
    func next() -> Int {
        if !hasNext() {
            return -1
        }

        return stack.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
        while !stack.isEmpty, !stack.last!.isInteger() {
            let list = stack.removeLast().getList()
            fillStack(list)
        }

        return !stack.isEmpty
    }

    private func fillStack(_ nestedList: [NestedInteger]) {
        for i in stride(from: nestedList.count - 1, through: 0, by: -1) {
            stack.append(nestedList[i])
        }
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
