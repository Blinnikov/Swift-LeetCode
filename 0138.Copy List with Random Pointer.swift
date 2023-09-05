/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var pointer = head
        var next = head

        while pointer != nil {
            next = pointer!.next

            let newNode = Node(pointer!.val)
            pointer!.next = newNode
            newNode.next = next
            pointer = next
        }

        pointer = head

        while pointer != nil {
            if pointer!.random != nil {
                pointer!.next?.random = pointer!.random!.next
            }

            pointer = pointer!.next?.next
        }

        pointer = head
        var fake: Node? = Node(-1)
        var copy = fake
        var copyPointer = fake

        while pointer != nil {
            next = pointer!.next?.next

            copy = pointer!.next
            copyPointer?.next = copy
            copyPointer = copy
            
            pointer!.next = next
            pointer = next
        }

        return fake?.next
    }
}
