class Solution {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        derived.reduce(0, ^) == 0
    }
}
