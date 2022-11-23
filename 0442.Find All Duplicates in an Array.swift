class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()

        for num in nums {
            let idx = num - 1
            if nums[idx] < 0 {
                result.append(abs(num))
            } else {
                nums[idx] *= -1
            }
        }

        return result
    }

    func findDuplicates_v1(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        var result = [Int]()

        for num in nums {
            if set.contains(num) {
                result.append(num)
            } else {
                set.insert(num)
            }
        }

        return result
    }
}
