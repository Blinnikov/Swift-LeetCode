/**
 * Definition for a QuadTree node.
 * public class Node {
 *     public var val: Bool
 *     public var isLeaf: Bool
 *     public var topLeft: Node?
 *     public var topRight: Node?
 *     public var bottomLeft: Node?
 *     public var bottomRight: Node?
 *     public init(_ val: Bool, _ isLeaf: Bool) {
 *         self.val = val
 *         self.isLeaf = isLeaf
 *         self.topLeft = nil
 *         self.topRight = nil
 *         self.bottomLeft = nil
 *         self.bottomRight = nil
 *     }
 * }
 */

class Solution {
    private var grid = [[Int]]()

    func construct(_ grid: [[Int]]) -> Node? {
        self.grid = grid
        return construct(0, grid.count - 1, 0, grid[0].count - 1)
    }

    private func construct(_ xFrom: Int, _ xTo: Int, _ yFrom: Int, _ yTo: Int) -> Node {
        if xFrom == xTo && yFrom == yTo {
            let val = grid[xFrom][yFrom] == 1
            return Node(val, true)
        }

        if allValuesTheSame(xFrom, xTo, yFrom, yTo) {
            let val = grid[xFrom][yFrom] == 1
            return Node(val, true)
        }

        let xMid = (xFrom + xTo) / 2
        let yMid = (yFrom + yTo) / 2

        var node = Node(false, false)
        node.topLeft = construct(xFrom, xMid, yFrom, yMid)
        node.topRight = construct(xFrom, xMid, yMid + 1, yTo)
        node.bottomLeft = construct(xMid + 1, xTo, yFrom, yMid)
        node.bottomRight = construct(xMid + 1, xTo, yMid + 1, yTo)

        return node
    }

    private func allValuesTheSame(_ xFrom: Int, _ xTo: Int, _ yFrom: Int, _ yTo: Int) -> Bool {
        let sample = grid[xFrom][yFrom]

        for x in xFrom...xTo {
            for y in yFrom...yTo {
                if grid[x][y] != sample {
                    return false
                }
            }
        }

        return true
    }
}
