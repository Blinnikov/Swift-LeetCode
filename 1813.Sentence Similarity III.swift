class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        var deq1 = sentence1.components(separatedBy: " ")
        var deq2 = sentence2.components(separatedBy: " ")

        while !deq1.isEmpty, !deq2.isEmpty, deq1.first! == deq2.first! {
            deq1.removeFirst()
            deq2.removeFirst()
        }

        while !deq1.isEmpty, !deq2.isEmpty, deq1.last! == deq2.last! {
            deq1.removeLast()
            deq2.removeLast()
        }

        return deq1.isEmpty || deq2.isEmpty
    }
}
