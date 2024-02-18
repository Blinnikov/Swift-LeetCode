class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        var roomMeetingCount = Array(repeating: 0, count: n)
        var roomFreeTime = Array(repeating: 0, count: n)

        var meetings = meetings.sorted { $0[0] < $1[0] }
        // print(meetings)

        for i in 0..<meetings.count {
            let start = meetings[i][0]
            let end = meetings[i][1]

            var minFreeTime = Int.max
            var minRoomNum = -1
            var freeRoomFound = false

            for roomNum in 0..<n {
                if roomFreeTime[roomNum] < minFreeTime {
                    minFreeTime = roomFreeTime[roomNum]
                    minRoomNum = roomNum
                }

                if roomFreeTime[roomNum] <= start {
                    freeRoomFound = true
                    roomMeetingCount[roomNum] += 1
                    roomFreeTime[roomNum] = end
                    break
                }
            }

            if !freeRoomFound {
                roomMeetingCount[minRoomNum] += 1
                roomFreeTime[minRoomNum] += (end - start)
            }
        }

        var roomNum = -1
        var maxCount = -1

        for i in 0..<n {
            if roomMeetingCount[i] > maxCount {
                maxCount = roomMeetingCount[i]
                roomNum = i
            }
        }

        return roomNum
    }
}
