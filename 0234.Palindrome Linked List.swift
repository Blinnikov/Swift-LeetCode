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
    func isPalindrome(_ head: ListNode?) -> Bool {
        checkIsPalindromeWithTwoPointers(head)
        // checkIsPalindromeWithAdditionalArray(head)
    }
    
    func checkIsPalindromeWithAdditionalArray(_ head: ListNode?) -> Bool {
        let arr = toArray(head)
        
        var first = 0
        var last = arr.count - 1
        
        while first < last {
            if arr[first] != arr[last] {
                return false
            }
            
            first += 1
            last -= 1
        }
        
        return true
    }
    
    func checkIsPalindromeWithTwoPointers(_ head: ListNode?) -> Bool {
        var slowPointer = head
        var fastPointer = head
        
        while(fastPointer?.next != nil && fastPointer?.next?.next != nil) {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        var listEnd = reverse(slowPointer?.next)
        
        var currStart = head
        var currEnd = listEnd
        while(currEnd != nil) {
            if currStart?.val != currEnd?.val {
                return false
            }
            
            currStart = currStart?.next
            currEnd = currEnd?.next
        }
        
        return true
    }
    
    private func toArray(_ head: ListNode?) -> [Int] {
        var result = [Int]()
        
        var curr = head
        while curr != nil {
            result.append(curr!.val)
            curr = curr!.next
        }
        
        return result
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        var currentNode = head
        var prevNode: ListNode? = nil
        var tempNode: ListNode? = nil
        
        while currentNode != nil {
            tempNode = currentNode?.next
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = tempNode
        }
        
        return prevNode
    }
    
    func printList(_ head: ListNode?) {
        var curr = head
        var result = ""
        while curr != nil {
            result += "\(curr!.val)"
            if curr?.next != nil {
                result += " -> "
            }
            curr = curr?.next
        }
        
        print(result)
    }
}
