class Solution {
    func numberOfWays(_ corridor: String) -> Int {
        var seats = 0
        var plants = 0
        var res = 1

        for ch in corridor {
            if ch == "S" {
                seats += 1
            } else if seats == 2 {
                plants += 1
            }

            if seats == 3 {
                res = (res * (plants + 1)) % 1000000007
                seats = 1
                plants = 0
            }
        }

        if seats != 2 {
             return 0
        }

        return res
    }
}
