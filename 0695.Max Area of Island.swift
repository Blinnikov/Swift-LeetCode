class Solution {
    private var m: Int = 0
    private var n: Int = 0
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        m = grid.count
        n = grid[0].count
        
        var uf = UnionFind(size: m*n)
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    let me = indicesToInt(i, j)
                    uf.union(me, me)
                    
                    // left
                    if j > 0 && grid[i][j-1] == 1 {
                        let left = indicesToInt(i, j-1)
                        uf.union(left, left)
                        uf.union(me, left)
                    }
                    
                    // upper
                    if i > 0 && grid[i-1][j] == 1 {
                        let upper = indicesToInt(i-1, j)
                        uf.union(upper, upper)
                        uf.union(me, upper)
                    }
                    
                    // right 
                    if j < n-1 && grid[i][j+1] == 1 {
                        let right = indicesToInt(i, j+1)
                        uf.union(right, right)
                        uf.union(me, right)
                    }
                    
                    // bottom
                    if i < m-1 && grid[i+1][j] == 1 {
                        let bottom = indicesToInt(i+1, j)
                        uf.union(bottom, bottom)
                        uf.union(me, bottom)
                    }
                }
            }
        }
        
        let res = uf.maxSize()
        return res == -1 ? 0 : res
    }
    
    private func indicesToInt(_ i: Int, _ j: Int) -> Int {
        i * n + j
    }
}

class UnionFind {
  // The number of elements in this union find
  private(set) var size: Int

  // Used to track the size of each of the component
  private var sz: [Int]

  // id[i] points to the parent of i, if id[i] = i then i is a root node
  private var id: [Int]

  // Tracks the number of components in the union find
  private(set) var numComponents: Int

  init(size: Int) {

    // if (size <= 0) throw new IllegalArgumentException("Size <= 0 is not allowed");

    self.size = size
    self.numComponents = size
      
    sz = Array(repeating: -1, count: size)
    id = Array(repeating: 1, count: size)
      
    for i in 0..<size {
        id[i] = i // Link to itself (self root)
        // sz[i] = 1 // Each component is originally of size one
    }
  }

  // Find which component/set 'p' belongs to, takes amortized constant time.
  public func find(_ p: Int) -> Int {
      var p = p
    // Find the root of the component/set
    var root = p;
    while (root != id[root]) {
        root = id[root]
    }

    // Compress the path leading back to the root.
    // Doing this operation is called "path compression"
    // and is what gives us amortized time complexity.
    while (p != root) {
      let next = id[p]
      id[p] = root
      p = next
    }

    return root
  }

  // This is an alternative recursive formulation for the find method
  // public int find(int p) {
  //   if (p == id[p]) return p;
  //   return id[p] = find(id[p]);
  // }

  // Return whether or not the elements 'p' and
  // 'q' are in the same components/set.
  public func connected(_ p: Int, _ q: Int) -> Bool {
    find(p) == find(q)
  }
    
    public func components() -> Int {
        // print(sz)
        return sz.reduce(0, { $1 > 0 ? $0 + 1 : $0 })
    }
    
    public func maxSize() -> Int {
        sz.max() ?? 0
    }

  // Unify the components/sets containing elements 'p' and 'q'
  public func union(_ p: Int, _ q: Int) {
      // print("Unifying \(p), \(q)")
      if p == q && sz[p] == -1 {
          sz[p] = 1
          return
      }
    // These elements are already in the same group!
    if (connected(p, q)) {
        return
    }

    let root1 = find(p);
    let root2 = find(q);
      
      // print("\(root1) \(root2)")

    // Merge smaller component/set into the larger one.
    if (sz[root1] < sz[root2]) {
      sz[root2] += sz[root1];
      id[root1] = root2;
      sz[root1] = 0;
    } else {
      sz[root1] += sz[root2];
      id[root2] = root1;
      sz[root2] = 0;
    }

    // Since the roots found are different we know that the
    // number of components/sets has decreased by one
    numComponents -= 1
  }
}
