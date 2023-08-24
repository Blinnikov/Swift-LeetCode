class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res = [String]()

        var idx = 0

        while idx < words.count {
            var width = words[idx].count
            var pointer = idx + 1

            while pointer < words.count {
                if words[pointer].count + width + 1 > maxWidth {
                    break
                }

                width += words[pointer].count + 1
                pointer += 1
            }

            var subRes = [String]()
            let diff = pointer - idx - 1

            if pointer == words.count || diff == 0 {
                for i in idx..<pointer {
                    subRes.append(words[i])
                    subRes.append(" ")
                }

                subRes.removeLast()

                var str = subRes.reduce("", +)

                for i in str.count..<maxWidth {
                    str += " "
                }

                subRes = [str]
            } else {
                let spaces = (maxWidth - width) / diff
                let r = (maxWidth - width) % diff

                for i in idx..<pointer {
                    subRes.append(words[i])

                    if i < pointer - 1 {
                        for j in 0...(spaces + (i - idx < r ? 1 : 0)) {
                            subRes.append(" ")
                        }
                    }
                }
            }

            res.append(subRes.reduce("", +))
            idx = pointer
        }

        return res
    }
}
