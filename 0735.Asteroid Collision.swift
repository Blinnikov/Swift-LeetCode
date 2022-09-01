class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var asteroids = asteroids 
        var result = [Int]()
        var negativeStack = [Int]()
        
        while !asteroids.isEmpty {
            while let last = asteroids.last, last > 0 {
                result.insert(asteroids.removeLast(), at: 0)
            }

            while let last = asteroids.last, last < 0 {
                negativeStack.append(asteroids.removeLast())
            }

            while !asteroids.isEmpty && asteroids.last! > 0 && !negativeStack.isEmpty {
                let positive = asteroids.removeLast()
                let negative = negativeStack.removeLast()

                if abs(positive) > abs(negative) {
                    asteroids.append(positive)
                } else if abs(positive) < abs(negative) {
                    negativeStack.append(negative)
                }
            }
        }
        
        if !negativeStack.isEmpty {
            result = negativeStack.reversed() + result
        }
        
        return result
    }
}
