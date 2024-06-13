class Solution {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        let seats = seats.sorted()
        let students = students.sorted()

        var res = 0

        for i in 0..<seats.count {
            res += abs(seats[i] - students[i])
        }
        
        return res
    }
}
