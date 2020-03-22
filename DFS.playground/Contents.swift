
import UIKit

class SolvingCriticalNode {

  let numNodes = 4, numEdges = 4, edges = [[0,1],[1,2],[2,0],[1,3]]
  
    var unSafeNodes = [Int]()
    var parsedOrder: [Int] = []
    var parsedElements: Set<Int> = []
    
    func checkCriticalNodes(numNodes: Int, numEdges: Int, edges: [[Int]]) {
        var dict: [Int: Set<Int>] = [:]
        
        for i in 0...numNodes {
            dict[i] = []
        }
        
        for edge in edges {
            if dict[edge[0]] != nil {
                var indexSet: Set<Int> = dict[edge[0]]!
                indexSet.insert(edge[1])
                dict[edge[0]] = indexSet
            }
            
            if dict[edge[1]] != nil {
                var indexSet: Set<Int> = dict[edge[1]]!
                indexSet.insert(edge[0])
                dict[edge[1]] = indexSet
            }
        }
        
        
        for i in 0..<numNodes {
         let removingNode = numNodes - (i + 1)
         var rootNode = 0
         if i  == 0 || removingNode == 0 { rootNode = 1}
        
         updatedDFSToProblem(rootNode: rootNode, allNodes: dict, initialNode: rootNode, removingNode: removingNode)
         debugPrint(parsedOrder)
         debugPrint("Root Node is :\(rootNode) & removingNode:\(removingNode) parsedCount: \(parsedElements.count)")
            
        if parsedElements.count < numNodes - 2 {
            unSafeNodes.append(removingNode)
        }
        
        if dict[i]!.count == 1 {
            unSafeNodes.append(i)
        }
        
         parsedOrder = []
         parsedElements = []
        }

        debugPrint(unSafeNodes)
        debugPrint(dict)
        
    }

    
    func updatedDFSToProblem(rootNode: Int, allNodes: [Int: Set<Int>], initialNode: Int, removingNode: Int) {
        for neighbour in allNodes[rootNode]! where neighbour != initialNode && !parsedElements.contains(neighbour) && neighbour != removingNode {
            parsedElements.insert(neighbour)
            parsedOrder.append(neighbour)
            if parsedElements.count == numNodes {
                break;
            }
            //debugPrint("Neighbour is: \(neighbour)")
            updatedDFSToProblem(rootNode: neighbour, allNodes: allNodes, initialNode: initialNode, removingNode: removingNode)
        }
    }


}

let solving = SolvingCriticalNode()
solving.checkCriticalNodes(numNodes: solving.numNodes, numEdges: solving.numEdges, edges: solving.edges)

//func dfs(rootNode: TreeNode?) {
    //if rootNode.left != nil {
        //dfs(rootNode: rootNode.left)
    //}
    
    
//    if rootNode.right != nil {
//        dfs(rootNode: rootNode.right)
//    }
//}


//Depth First Search!!
//var parsedOrder: [Int] = []
//var parsedElements: Set<Int> = []
//let allNodes: [Int: Set<Int>] = [6: Set([5]), 2: Set([5, 0, 3]), 7: Set([]), 0: Set([2, 1]), 3: Set([4, 1, 2]), 4: Set([3]), 1: Set([0, 3]), 5: Set([6, 2])]
//var totalNodes: Int = 7
//var initialNode: Int = 2
//
//
//func DFS(rootNode: Int, allNodes: [Int: Set<Int>]) {
//        for neighbour in allNodes[rootNode]! where neighbour != initialNode && !parsedElements.contains(neighbour) {
//            parsedElements.insert(neighbour)
//            parsedOrder.append(neighbour)
//            if parsedElements.count == totalNodes {
//                break;
//            }
//            debugPrint("Neighbour is: \(neighbour)")
//            newDFS(rootNode: neighbour, allNodes: allNodes)
//        }
//}
//
//DFS(rootNode: initialNode, allNodes: allNodes)
//debugPrint("RootNode: 6")
//debugPrint(parsedElements)
//debugPrint(parsedOrder)


//breadth first search

var result = 0
func findGCD(num: Int, numbers: [Int]) -> Int {
    result = numbers[0]
    
    for i in 1..<num {
        result = findGCDForTwo(numbers[i], result)
        
        if result == 1 {
           result = 1
            break;
        }
    }
    
     return result
    
}
func findGCDForTwo(_ num1: Int, _ num2: Int) -> Int {
    if num1 == 0 {
        return num2
    }
        return findGCDForTwo(num2 % num1, num1)
    }

class twoSum2Solution {

    
     func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
         var indexHashMap: [Int: Int] = [:]
         var occuranceHashMap: [Int: Int] = [:]
         var count = 0
         var result: [Int] = []
         
         for num in nums {
             indexHashMap[count] = num
             
             if occuranceHashMap[num] != nil {
                 occuranceHashMap[num] = occuranceHashMap[num]! + 1
             } else {
                 occuranceHashMap[num] = 1
             }
             count += 1
         }
         debugPrint(occuranceHashMap)
         debugPrint(indexHashMap)
        
         count = 0
         
         for num in nums {
             let valueSearch = target - num
             
             if occuranceHashMap[valueSearch] != nil {
                if num == target/2 {
                    var noOfOccurances = occuranceHashMap[num]!
                    if noOfOccurances > 1 {
                        result.append(count)
                    }
                } else {
                    result.append(count)
                }
                
                   
               
                 var noOfOccurances = occuranceHashMap[valueSearch]!
                 if noOfOccurances == 1 {
                     if let value = occuranceHashMap.removeValue(forKey:valueSearch) {
                         //debugPrint("The value \(valueSearch) was removed.")
                     }
                 } else {
                     occuranceHashMap[valueSearch] = noOfOccurances - 1
                 }
             }
             
             count += 1
         }
    
         return result
         
     }
}
//debugPrint(twoSum2Solution().twoSum2([3,3],6))

func permutation(_ string: String) -> [String] {
    let strArr = Array(string)
       var stringLength = strArr.count
        var current = ""
        if string == "" {
            // there's nothing left to re-arrange; print the result
            print(current)
            print("******")
            debugPrint("in IF")
            stringLength = 0
        } else {
             debugPrint("in Else")
            for i in 0..<stringLength {
                debugPrint("strarr is :\(strArr)")
            let leftPartOfString = String(strArr[0..<i])
            let rightPartOfString = String(strArr[i+1..<stringLength])
                debugPrint("LeftPart: \(leftPartOfString)")
                debugPrint("rightPartOfString: \(rightPartOfString)")
                current = current + String(strArr[i])
                debugPrint("combined: \(leftPartOfString+rightPartOfString)")
               permutation(leftPartOfString+rightPartOfString)
               
            }
            
        }
        return []
    }
//permutation("())())")

class Solution5 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 || nums.count == 1 || nums.count == 2 {
            return []
        }
        
        var setNums: Set<Int> = []
        var indexes: [Int: [Int]] = [:]
        let enumeratedNum = nums.enumerated()
        for (index,num) in enumeratedNum {
            
            if indexes[num] != nil {
                var indx = indexes[num]!
                indx.append(index)
                indexes[num] = indx
            } else {
                indexes[num] = [index]
            }
            
            setNums.insert(num)
        }
        
        var tempSet: Set<Set<Int>> = []
        
        var result:[[Int]] = []
        
        for (indexA,num1) in enumeratedNum {
            for (indexB,num2) in enumeratedNum where indexA != indexB {
                let num3 = -(num1+num2)
                //find index
            
                if setNums.contains(num3) && !tempSet.contains([num1, num2, num3]) {
                    
                    if num1 == num3 && num2 == num3 {
                         var indexNum3 = indexes[num3]!
                         if indexNum3.count > 2 {
                            result.append([num1, num2, num3])
                            tempSet.insert([num1, num2, num3])
                            indexNum3.removeFirst()
                            indexes[num3] = indexNum3
                        }
                    } else if num1 == num3 || num2 == num3 {
                         //checkIndex of num3
                        var indexNum3 = indexes[num3]!
                        if indexNum3.count > 1 {
                            result.append([num1, num2, num3])
                            tempSet.insert([num1, num2, num3])
                            indexNum3.removeFirst()
                            indexes[num3] = indexNum3
                        }
                    } else {
                        result.append([num1, num2, num3])
                        tempSet.insert([num1, num2, num3])
                    }
                    
                }
            }
        }
        return result
    }
        
}

//Solution5().threeSum([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])


let string: String = "I m Larry"
if string.contains("I m Larry") {
    debugPrint("true123")
}

// queue
var queue:[Int] = []
//FIFO
//enque
//dequeue

func enqueue(data: Int) {
    queue.append(data)
}

func dequeue() {
    queue.removeFirst()
}

// stack
// for DFS/ LinkedList

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
//LIFO

var S:String = "asdsadaie"
S.lowercased()
let chars = ["a", "e", "i", "o", "u"]
var ss = S.replacingOccurrences(of: "[a,e,i,o,u]", with: "", options: .regularExpression)
//debugPrint(ss)

class Solution33 {
    var newTreeNode:TreeNode?
    var referenceNode: TreeNode?
    
    func flatten(_ root: TreeNode?) {
        if root == nil { return }
        //newTreeNode = TreeNode(root!.val)
        referenceNode = root
        dfs(root!)
        //root?.right = newTreeNode!.right!.right
        root?.left = nil
    }
        
    func dfs(_ rootNode: TreeNode) {
        referenceNode?.right  = TreeNode(rootNode.val)
        referenceNode = referenceNode?.right
        if rootNode.left != nil {
            dfs(rootNode.left!)
        }
        
        if rootNode.right != nil {
            dfs(rootNode.right!)
        }
    }
}
var treeNodeTest = TreeNode(1)
treeNodeTest.left = TreeNode(2)
treeNodeTest.right = TreeNode(5)
treeNodeTest.left!.left = TreeNode(3)
treeNodeTest.left!.right = TreeNode(4)
treeNodeTest.right!.right = TreeNode(6)
//debugPrint(Solution33().flatten(treeNodeTest))

class Solution23 {
  func hammingDistance(_ x: Int, _ y: Int) -> Int {
      
      if x > y {
          return hammingDistance(y, x)
      }
      String(x, radix: 2)
      let xB = Array(String(x, radix: 2).reversed())
      let yB = Array(String(y, radix: 2).reversed())
  
      var result = 0
      
      for i in 0..<xB.count where xB[i] != yB[i] {
          result += 1
      }
      for i in xB.count..<yB.count where yB[i] == "1" {
          result += 1
      }
      return result
  }
}

debugPrint(Solution23().hammingDistance(1, 4))

class UniqueSolution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
       let dict: [String:String] =  ["a":".-","b":"-...","c":"-.-.","d":"-..","e":".","f":"..-.","g":"--.","h":"....","i":"..","j":".---","k":"-.-","l":".-..","m":"--","n":"-.","o":"---","p":".--.","q":"--.-","r":".-.","s":"...","t":"-","u":"..-","v":"...-","w":".--","x":"-..-","y":"-.--","z":"--.."]
        var setS:Set<String> = []
        
        for word in words {
            var word: String = ""
          for s in Array(words) {
            word += dict[s]!
          }
           setS.insert(word)
        }
        
        return setS.count
    }
}
//
//debugPrint(UniqueSolution().uniqueMorseRepresentations(["gin", "zen", "gig", "msg"]))


class reverseStrSolution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        let sLength = s.count
        var substring: String = ""
        var resultString: String = ""
        var counter: Int = 0
        
        if s.count == 1 { return s }
        
        if 2*k - 1 == sLength {
            let subString = s[s.startIndex...s.index(s.startIndex, offsetBy: k-1)]
            let restSubString = s[s.index(s.startIndex, offsetBy: k)..<s.endIndex]
            return String(subString.reversed())+restSubString
        }
        
        for c in s {
            substring += String(c)
            if substring.count%k == 0 {
                if counter%k == 0 {
                    substring = String(substring.reversed())
                }
                
                resultString += substring
                counter += 1
                substring = ""
            }
        }
        
        if !substring.isEmpty {
            resultString += String(substring.reversed())
        }
        
        return resultString
        
    }
    
    
}

//debugPrint(reverseStrSolution().reverseStr("abcdefg",8))
class oddCellsSolution {
    func oddCells(_ n: Int, _ m: Int, _ indices: [[Int]]) -> Int {
        
        var initialMatrix = Array(repeating: Array(repeating: 0, count: m), count: n)
        var count: Int = 0
        for index in indices {
            initialMatrix[index[0]] = initialMatrix[index[0]].map{$0+1}
            for i in 0..<n {
                initialMatrix[i][index[1]] += 1
            }
        }
        
        for row in initialMatrix {
            for column in row {
                if column%2 != 0 {
                    count += 1
                }
            }
        }
        
        return count
    }
}

//debugPrint(oddCellsSolution().oddCells(2, 3, [[0,1],[1,1]]))


class countNegativesSolution {
  func countNegatives(_ grid: [[Int]]) -> Int {
      var result:Int = 0
      let columnCount = grid[0].count
      
      for row in grid {
        debugPrint("---- in row:\(row) ---")
          for i in 0..<columnCount where row[i] < 0 {
            debugPrint("ColumnCount is: \(columnCount) and i:\(i)")
              result += columnCount-i
            debugPrint("Result: \(result)")
              break
          }
      }
      
      return result
      
  }
}

//debugPrint(countNegativesSolution().countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]))

class repeatedNTimesSolution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        let result = A.reduce(0,+) - Array(Set(A)).reduce(0,+)
        let n = A.count/2
        return Int(pow(Double(result), Double(1/(n-1))))
    }
}

//debugPrint(repeatedNTimesSolution().repeatedNTimes([1,2,3,3]))
class replaceElementsSolution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var result:[Int] = []
        var subArray = arr
        var soretedArr = arr.sorted()
        
        for i in 0..<arr.count-1 {
            debugPrint("testing: \(arr[i])")
            subArray.remove(at: 0)
            soretedArr.removeAll(where: {$0 == arr[i]})
            result.append(soretedArr.last!)
        }
        result.append(-1)
        return result
    }
}

//debugPrint(replaceElementsSolution().replaceElements([17,18,5,4,6,1]))

class sortStringSolution {
    func sortString(_ s: String) -> String {
        var sArr = Array(s).sorted()
        var result: String = ""
        var subString: String = ""
        var lastElementAdded: Character = "/"
        
        while sArr.count != 0 {
            debugPrint("countStart: \(sArr.count)")
            for i in (0..<sArr.count).reversed() {
                if sArr[i] != lastElementAdded {
                    subString += String(sArr[i])
                    lastElementAdded = sArr[i]
                    sArr.remove(at: i)
                }
            }
            
            result += String(subString.reversed())
            subString = ""
            lastElementAdded = "/"
            
            for i in (0..<sArr.count).reversed() {
                if sArr[i] != lastElementAdded {
                    subString += String(sArr[i])
                    lastElementAdded = sArr[i]
                    sArr.remove(at: i)
                }
            }
            
            result += subString
            subString = ""
            lastElementAdded = "/"
            debugPrint("countEnd: \(sArr.count)")
            
        }
        
        return result
        
    }
}

//debugPrint(sortStringSolution().sortString("leetcode"))

class peakIndexInMountainArraySolution {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
         var lastNumber: Int = 0
         var ifChecked: Bool = false
         var elseChecked: Bool = false
         var isBreak: Bool = false
         
         for possibleNumber in 1..<A.count-1 {
             lastNumber = possibleNumber
             for i in 0...A.count-1 {
                 if i<possibleNumber {
                     if ifChecked && elseChecked {
                         isBreak = true
                         break
                     }
                    ifChecked = true
                    
                 } else {
                     elseChecked = true
                 }
             }
             
             if !isBreak {
                 return lastNumber
             } else {
                 isBreak = false
                 ifChecked = false
                 elseChecked = false
             }
         }
         
         return 0
     }
}

//debugPrint(peakIndexInMountainArraySolution().peakIndexInMountainArray([3,4,5,1]))

//1,2,3

class sortedSquaresSolution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var result = Array(repeating:0, count: A.count)
        var start: Int = 0
        var end: Int = A.count-1
        var insertPosition = end
        
        while start<=end {
            let sq1 = A[start]*A[start]
            let sq2 = A[end]*A[end]
            if sq1>sq2 {
                result[insertPosition] = sq1
                insertPosition -= 1
                start += 1
            } else {
                result[insertPosition] = sq2
                insertPosition -= 1
                end -= 1
            }
        }
        
        return result
    }
}

//debugPrint(sortedSquaresSolution().sortedSquares([-4,-1,0,3,10]))

class diStringMatchSolution {
    func diStringMatch(_ S: String) -> [Int] {
        // I means Select Smallest Number
        // D means Select the largest Number
        
        var selectionArray: [Int] = []
        var resultArr:[Int] = []
        
        for i in 0...S.count {
            selectionArray.append(i)
        }
        
        debugPrint(selectionArray)
        
        for c in S {
            if String(c) == "I" {
                resultArr.append(selectionArray[0])
                selectionArray.remove(at: 0)
            } else {
                // D
                resultArr.append(selectionArray.last!)
                selectionArray.removeLast()
            }
        }
        
        resultArr.append(selectionArray[0])
        
        return resultArr
        
    }
}

//debugPrint(diStringMatchSolution().diStringMatch("IDID"))

class generatePermutationsSolution {
    var arrayResult: [String] = []
    
    func generatePermutations(_ s: String) -> [String] {
       let a = Array(s)
        permutations(a, a.count-1)
       
      return arrayResult
    }
    
//    func permutations(_ n: Int, _ a: inout Array<Character>) {
//        if n == 1 {
//            arrayResult.append(String(a))
//            return
//        }
//        for i in 0..<n-1 {
//            permutations(n-1, &a)
//            a.swapAt(n-1, n%2 == 0 ? 0 : i)
//        }
//        permutations(n-1, &a)
//    }
//
    func permutations(_ a: [Character], _ n: Int) {
        if n == 0 {
            arrayResult.append(String(a))
        } else {
            var a = a
            permutations(a, n - 1)
            for i in 0..<n {
                a.swapAt(i, n)
                permutations(a, n - 1)
                a.swapAt(i, n)
            }
        }
    }

}

//debugPrint(generatePermutationsSolution().generatePermutations("aab"))

class generatePalindromesSolution {
    var arrayResult: Set<String> = []
    var singleCharacter: Character = "/"
    
    func generatePalindromes(_ s: String) -> [String] {
      var dict:[Character: Int] = [:]
      var dataArray: [Character] = []
      
      
      var count: Int = 0
        for c in s {
            dict[c, default: 0] += 1
        
        }
        
        for (key, value) in dict {
            
            if value%2 != 0 {
                if value != 1 {
                    for _ in 0..<(value-1)/2 {
                        dataArray.append(key)
                    }
                }
                singleCharacter = key
                count += 1
            } else {
                for _ in 0..<value/2 {
                    dataArray.append(key)
                }
            }
        }
        
        if dict.count == 1 {
            return [s]
        }
        
        if count >= 2 {
            return []
        } else {
           
            debugPrint(dataArray)
            permutations(dataArray, dataArray.count-1)
            return Array(arrayResult)
        }
    }
    
    func permutations(_ a: [Character], _ n: Int) {
        if n == 0 {
            if singleCharacter != "/" {
                arrayResult.insert(String(a)+String(singleCharacter)+String(a.reversed()))
            } else {
                arrayResult.insert(String(a)+String(a.reversed()))
            }
        } else {
            var a = a
            permutations(a, n - 1)
            for i in 0..<n  {
                if a[i] != a[n] {
                   a.swapAt(i, n)
                   permutations(a, n - 1)
                   a.swapAt(i, n)
                }
               
            }
        }
    }

}


//debugPrint(generatePalindromesSolution().generatePalindromes("aaaabbbb"))

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
     self.val = val
     self.next = nil
     }
 }

class reverseListSolution {
    var newList: ListNode?

    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return newList }
        var head = head
        newList = head
        iterate(&head)
        return newList
    }

    func iterate(_ head: inout ListNode?) {
        if head == nil { return }
        newList!.next = head
        head = head!.next
        iterate(&head!.next)
    }
}
let newNode = ListNode(1)
newNode.next = ListNode(2)
newNode.next = ListNode(3)
newNode.next = ListNode(4)
newNode.next = ListNode(5)

//debugPrint(reverseListSolution().reverseList(newNode))

class findComplementSolution {
    func findComplement(_ num: Int) -> Int {
        var num = num
        var bitsRev: [Int] = []
        var counter: Int = 0
        var result: Double = 0
        
        while num != 1 {
            if num%2 == 0 {
                bitsRev.insert(1, at: 0)
            } else {
               bitsRev.insert(0, at: 0)
            }
            num = num/2
        }
        bitsRev.insert(0, at: 0)
        
        debugPrint(bitsRev)
        for bit in bitsRev.reversed() {
            if bit != 0 {
                result += pow(Double(2.0), Double(counter))
            }
            counter += 1
        }
        
        return Int(result)
    }
}

//debugPrint(findComplementSolution().findComplement(5))

class subdomainVisitsSolution {
     func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var data:[String: Int] = [:]
        var result: [String] = []

        for domain in cpdomains {

            let componentS = domain.components(separatedBy: " ")
            data[componentS[1]] = Int(componentS[0])
            var subComponents: [String] = []
            var tempComponent: [Character] = []
            for c in componentS[1].reversed() {
                if c == "." {
                    if let lastComponent = subComponents.last {
                        subComponents.append(String(tempComponent.reversed()) + "." + lastComponent)
                    } else {
                        
                        subComponents.append(String(tempComponent.reversed()))
                    }
                    
                    tempComponent = []
                } else {
                     tempComponent.append(c)
                }
            }
            
            debugPrint(subComponents)
            
            for singleComponent in subComponents {
              if data[singleComponent] != nil {
                 data[singleComponent] = data[singleComponent]! + Int(componentS[0])!
              } else {
                
                  data[singleComponent] = Int(componentS[0])!
              }
            }
        }

        for (key,value) in data {
            result.append(String(value) + " " + key)
        }

        return result

    }
}

//debugPrint(subdomainVisitsSolution().subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]))


class islandPerimeterSolution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let rowCount = grid.count
        let columnCount = grid[0].count
        var parameter: Int = 0
        
        for (indexRow,row) in grid.enumerated() {
            for (indexColumn,column) in row.enumerated() {
                let current = grid[indexRow][indexColumn]
                var cornerSum = 0
                if current == 1 {
                    
                    // check Left
                    if indexRow-1 >= 0 {
                        if grid[indexRow-1][indexColumn] == 0 {
                            cornerSum += 1
                        }
                    } else {
                        //Left doesn't exist // Side Case
                        cornerSum += 1
                    }
                    
                    // check Right
                    if indexRow+1 < rowCount {
                       if grid[indexRow+1][indexColumn] == 0 {
                            cornerSum += 1
                        }
                    } else {
                        cornerSum += 1
                    }
                    
                     // check Up
                    if indexColumn-1 >= 0 {
                       if grid[indexRow][indexColumn-1] == 0 {
                            cornerSum += 1
                        }
                    } else {
                        cornerSum += 1
                    }
                    
                    // check Down
                    if indexColumn+1 < columnCount {
                       if grid[indexRow][indexColumn+1] == 0 {
                            cornerSum += 1
                        }
                    } else {
                        cornerSum += 1
                    }
                }
                parameter += cornerSum
                cornerSum = 0
                
            }
        }
        return parameter
    }
}

//debugPrint(islandPerimeterSolution().islandPerimeter([[0,1,0,0],
//[1,1,1,0],
//[0,1,0,0],
//[1,1,0,0]]))

class minDeletionSizeSolution {
    func minDeletionSize(_ A: [String]) -> Int {
        var lastAray: [Character] = []
        var result:Set<Int> = []
        
       for v in A {
            if lastAray.count == 0 {
                lastAray = Array(v)
            } else {
                //compare values
                let newArr = Array(v)
                for i in 0..<newArr.count where lastAray[i] > newArr[i] {
                    result.insert(i)
                }
                lastAray = newArr
            }
        }
        
        debugPrint(result)
        return result.count
    }
}

//debugPrint(minDeletionSizeSolution().minDeletionSize(["a","b"]))

class generatePossibleNextMovesSolution {
    func generatePossibleNextMoves(_ s: String) -> [String] {
        var result: [String] = []
        let sArray = s.map({String($0)})
        
        if sArray.count < 2 {
            return []
        }
        
        for i in 0..<sArray.count-1 {
            var tempArr = sArray
            if tempArr[i] + tempArr[i+1] == "++" {
                tempArr[i] = "-"
                tempArr[i+1] = "-"
                result.append(tempArr.joined())
            }
        }
        
        return result
    }
}

//debugPrint(generatePossibleNextMovesSolution().generatePossibleNextMoves("++++"))

class nextGreaterElementSolution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums2Dict: [Int: Int] = [:]
        let nums2TotalValidIndexes: Int = nums2.count-1
        var result: [Int] = []

        for (index,nums) in nums2.enumerated() {
            nums2Dict[nums] = index
        }
        
        for number in nums1 {
            let nextIndex = nums2Dict[number]! + 1
            if nextIndex > nums2TotalValidIndexes {
                result.append(-1)
            } else {
                var isFound: Bool = false
                debugPrint("currentNumber: \(number)")
                for i in nextIndex...nums2TotalValidIndexes where !isFound && number < nums2[i] {
                    debugPrint("\(number) < \(nums2[i])")
                    isFound = true
                    result.append(nums2[i])
                }
                if !isFound {
                   result.append(-1)
                }
            }
        }
        
        return result
    }
}

//debugPrint(nextGreaterElementSolution().nextGreaterElement([1,3,5,2,4],
//[6,5,4,3,2,1,7]
//))

class majorityElementSolution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict:[Int: Int] = [:]
        let count = nums.count/2
        for num in nums {
            if dict[num] != nil {
                dict[num] = dict[num]! + 1
            } else {
                dict[num] = 1
            }
        }
        
        for key in dict.filter({$0.value > count}).keys {
            return key
        }
        
        return 0
    }
}
//debugPrint(majorityElementSolution().majorityElement([3,2,3]))

class uniqueOccurrencesSolution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var dict: [Int: Int] = [:]
        
        for value in arr {
            if dict[value] == nil {
                dict[value] = 1
            } else {
                dict[value] = dict[value]! + 1
            }
        }
        return Array(dict.values).count == Set(dict.values).count
    }
}
debugPrint(uniqueOccurrencesSolution().uniqueOccurrences([3,2,2,1,1,1]))
