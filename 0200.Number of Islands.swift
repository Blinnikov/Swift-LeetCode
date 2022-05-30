class Solution {
    private var m: Int = 0
    private var n: Int = 0
    
    func numIslands(_ grid: [[Character]]) -> Int {
        m = grid.count
        n = grid[0].count
        
        // for each "1" we put integer value in this array such as
        // coordinates[x] = i(0..<m) * n + j(0..<n)
        var coordinates = [Int]()
        
        var order = 0
        var map = [Int:Int]()
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    let coord = indicesToInt(i, j)
                    coordinates.append(coord)
                    
                    map[coord] = order
                    order += 1
                }
            }
        }
        
        // print("\(coordinates)\nsize=\(coordinates.count)")
        // print("\n\nMap:\n\(map)")
        
        var uf = UnionFind(size: coordinates.count)
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    let coord = indicesToInt(i, j)
                    // coordinates.append(coord)
                    
                    // left
                    if j > 0 && grid[i][j-1] == "1" {
                        uf.union(map[indicesToInt(i, j)]!, map[indicesToInt(i, j-1)]!)
                    }
                    
                    // upper
                    if i > 0 && grid[i-1][j] == "1" {
                        uf.union(map[indicesToInt(i, j)]!, map[indicesToInt(i-1, j)]!)
                    }
                    
                    // right 
                    if j < n-1 && grid[i][j+1] == "1" {
                        uf.union(map[indicesToInt(i, j)]!, map[indicesToInt(i, j+1)]!)
                    }
                    
                    // bottom
                    if i < m-1 && grid[i+1][j] == "1" {
                        uf.union(map[indicesToInt(i, j)]!, map[indicesToInt(i+1, j)]!)
                    }
                    
                    // map[coord] = order
                    // order += 1
                }
            }
        }
        
        return uf.numComponents
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
      
    sz = Array(repeating: 0, count: size) // new int[size];
    id = Array(repeating: 1, count: size) //new int[size];
      
      for i in 0..<size {
          id[i] = i
      }

    // for (int i = 0; i < size; i++) {
    //   id[i] = i; // Link to itself (self root)
    //   // sz[i] = 1; // Each component is originally of size one
    // }
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

  // Unify the components/sets containing elements 'p' and 'q'
  public func union(_ p: Int, _ q: Int) {

    // These elements are already in the same group!
    if (connected(p, q)) {
        return
    }

    let root1 = find(p);
    let root2 = find(q);

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
