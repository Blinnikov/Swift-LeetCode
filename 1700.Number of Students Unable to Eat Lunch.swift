class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var squares = students.reduce(0, +) // 1
        var circulars = students.count - squares  // 0

        var left = sandwiches.count

        for s in sandwiches {
            if s == 0, circulars == 0 {
                break
            }

            if s == 1, squares == 0 {
                break
            }

            if left == 0 {
                break
            }

            left -= 1

            if s == 0 {
                circulars -= 1
            } else {
                squares -= 1
            }
        }

        return left
    }
}
