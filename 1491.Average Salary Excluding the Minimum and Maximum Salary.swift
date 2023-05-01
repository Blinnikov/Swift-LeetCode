class Solution {
    func average(_ salary: [Int]) -> Double {
        let salaries = salary.sorted()
        let num = Double(salaries.count - 2)
        var sum: Double = 0

        for i in 1..<salaries.count - 1 {
            sum += Double(salaries[i])
        }
      
        return sum / num
    }
}
