class Solution {
    func bestClosingTime(_ customers: String) -> Int {
        let hours = Array(customers)

        var sum = 0
        var maxSum = 0
        var hour = 0

        for i in 0..<hours.count {
            sum += hours[i] == "Y" ? 1 : -1

            if sum > maxSum {
                maxSum = sum
                hour = i + 1
            }
        }

        return hour
    }
}
