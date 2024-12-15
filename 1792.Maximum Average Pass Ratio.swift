class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        var pq = PriorityQueue<Class> { $0.gain > $1.gain }

        for c in classes {
            let passCount = c[0]
            let students = c[1]
            
            let gain = gain(students, passCount)

            pq.enqueue(Class(gain: gain, students: students, passCount: passCount))
        }

        var students = extraStudents 

        while students > 0 {
            let cl = pq.dequeue()!

            pq.enqueue(Class(gain: gain(cl.students + 1, cl.passCount + 1), students: cl.students + 1, passCount: cl.passCount + 1))

            students -= 1
        }

        var res = 0.0

        while !pq.isEmpty {
            let cl = pq.dequeue()!

            res += Double(cl.passCount) / Double(cl.students)
        }

        return res / Double(classes.count)
    }

    private func gain(_ students: Int, _ passCount: Int) -> Double {
        Double(passCount + 1) / Double(students + 1) - Double(passCount) / Double(students)
    }
}

struct Class : Equatable {
    var gain: Double
    var students: Int
    var passCount: Int
}
