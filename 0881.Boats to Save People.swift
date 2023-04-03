class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var people = people.sorted()
        var boats = 0

        var lo = 0
        var hi = people.count - 1

        while lo <= hi {
            if people[lo] + people[hi] <= limit {
                lo += 1
            }

            hi -= 1
            boats += 1
        }

        return boats
    }
}
