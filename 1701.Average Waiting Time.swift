class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
         var idle = customers[0][0] + customers[0][1]
         var time = customers[0][1]

         for i in 1..<customers.count {
            let arrive = customers[i][0]
            let start = max(idle, arrive)
            let end = start + customers[i][1]

            idle = end
            time += end - arrive
         }

         return Double(time) / Double(customers.count)
    }
}
