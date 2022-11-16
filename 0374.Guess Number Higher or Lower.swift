/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *               otherwise return 0 
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        guessBinary(1, n)
    }

    private func guessBinary(_ lo: Int, _ hi: Int) -> Int {
        if lo == hi {
            return lo
        }

        let mid = (hi + lo) / 2
        let ans = guess(mid)

        if ans == 0 {
            return mid
        }

        if ans == -1 {
            return guessBinary(lo, mid - 1)
        }

        return guessBinary(mid + 1, hi)
    }
}
