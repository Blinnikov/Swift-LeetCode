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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? { 
        if list1 == nil && list2 == nil {
            return nil
        }
        
        if list1 == nil && list2 != nil {
            return list2
        }
        
        if list1 != nil && list2 == nil {
            return list1
        }
        
        if list1!.val <= list2!.val {
            let next = mergeTwoLists(list1!.next, list2)
            list1!.next = next
            return list1
        } else {
            let next = mergeTwoLists(list1, list2!.next)
            list2!.next = next
            return list2
        }
        
        return nil
    }
    
    private func mergeTwoLists_v1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var merged: ListNode? = ListNode()
        var mergedListPointer = merged
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            if l2!.val <= l1!.val {
                mergedListPointer?.next = l2
                l2 = l2?.next
            } else {
                mergedListPointer?.next = l1
                l1 = l1?.next
            }
            
            mergedListPointer = mergedListPointer?.next
        }
        
        if l1 == nil {
            mergedListPointer?.next = l2
        }
        
        if l2 == nil {
            mergedListPointer?.next = l1
        }
        
        return merged?.next
    }
}
