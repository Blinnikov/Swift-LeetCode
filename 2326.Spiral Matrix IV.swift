/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    private let dirs = [ (0, 1), (1, 0), (0, -1), (-1, 0)]

    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var res = Array(repeating: Array(repeating: -1, count: n), count: m)

        var dir = 0 
        var row = 0
        var col = 0
        var pointer = head

        while pointer != nil {
            res[row][col] = pointer!.val

            let nextRow = row + dirs[dir % 4].0
            let nextCol = col + dirs[dir % 4].1

            if min(nextCol, nextRow) < 0 || nextRow >= m || nextCol >= n || res[nextRow][nextCol] != -1 {
                dir += 1
            }

            row += dirs[dir % 4].0
            col += dirs[dir % 4].1

            pointer = pointer?.next
        }

        return res
    }
}
