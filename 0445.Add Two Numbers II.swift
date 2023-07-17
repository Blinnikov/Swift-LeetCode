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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var s1 = [Int]()
        var s2 = [Int]()

        var pointer = l1

        while pointer != nil {
            s1.append(pointer!.val)
            pointer = pointer!.next
        }

        pointer = l2

        while pointer != nil {
            s2.append(pointer!.val)
            pointer = pointer!.next
        }

        print(s1, s2)

        var sum = 0
        var curr = ListNode(0)

        while !s1.isEmpty || !s2.isEmpty {
            if !s1.isEmpty {
                sum += s1.removeLast()
            }

            if !s2.isEmpty {
                sum += s2.removeLast()
            }

            curr.val = sum % 10

            var node = ListNode(sum / 10)
            node.next = curr
            curr = node

            sum = sum / 10
        }

        return curr.val == 0 ? curr.next : curr

        // var n1 = listToNum(l1)
        // var n2 = listToNum(l2)

        // var sum = n1 + n2


        
        // return numToList(sum)
    }

    private func numToList(_ num: Int64) -> ListNode? {
        if num == 0 {
            return ListNode(0)
        }

        var rest = num
        var prev: ListNode? = nil

        while rest != 0 {
            let val = rest % 10
            var node = ListNode(Int(val))
            node.next = prev

            prev = node

            rest = rest / 10

            // print(prev)
        }

        return prev
    }

    private func listToNum(_ list: ListNode?) -> Int64 {
        var res: Int64 = 0
        var idx = 0

        var pointer = list

        while pointer != nil {
            res = res * 10 + Int64(pointer!.val)

            print(res)

            pointer = pointer!.next
        }

        print(res)

        return res
    }
}
