class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 {
            return true
        }

        var flowerbed = flowerbed
        var flowers = n

        for i in 0..<flowerbed.count {
            if canPot(at: i, in: &flowerbed) {
                print("Can pot at \(i)")
                if i > 0 {
                    if flowerbed[i - 1] == 0 {
                        flowerbed[i - 1] = -1
                    }
                }

                flowerbed[i] = 1

                if i < flowerbed.count - 1 {
                    if flowerbed[i + 1] == 0 {
                        flowerbed[i + 1] = -1
                    }
                }

                flowers -= 1

                if flowers == 0 {
                    return true
                }
            }
        }

        return false
    }

    private func canPot(at place: Int, in flowerbed: inout [Int]) -> Bool {
        if flowerbed.count == 1 {
            return flowerbed[0] == 0
        }

        if place == 0 && flowerbed[place] == 0 && flowerbed[place + 1] != 1 {
            return true
        }

        if (place == flowerbed.count - 1) && flowerbed[place] == 0 && flowerbed[place - 1] != 1 {
            return true
        }

        return (place > 0 && flowerbed[place - 1] != 1) 
                && flowerbed[place] == 0 
                && (place < flowerbed.count - 1) && flowerbed[place + 1] != 1
    }
}
