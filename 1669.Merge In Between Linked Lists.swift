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
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var leftPointer = list1

        for i in 0..<(a - 1) {
            leftPointer = leftPointer!.next
        }

        var rightPointer = leftPointer!.next

        for i in 0..<(b - a + 1) {
            rightPointer = rightPointer!.next
        }

        leftPointer!.next = list2

        var list2End = list2 

        while list2End!.next != nil {
            list2End = list2End!.next
        }

        list2End!.next = rightPointer

        return list1
    }
}
