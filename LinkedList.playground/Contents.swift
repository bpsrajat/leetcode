import UIKit

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


class Solution2 {
    var queue: [ListNode] = []
    var resultNode: ListNode = ListNode(0)
    var referenceNode: ListNode!
    var nextNode: ListNode?
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
       
        referenceNode = resultNode
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        var l1N: ListNode?
        var l2N: ListNode?
        l1N = l1
        l2N = l2
        var carry = 0
        while (l1N != nil || l2N != nil) {
            let listValue1 = l1N != nil ? l1N!.val : 0
            let listValue2 = l2N != nil ? l2N!.val : 0
            let sum = listValue1 + listValue2 + carry
            
            referenceNode.next = ListNode(0)
            referenceNode = referenceNode.next
            if sum < 10 {
                referenceNode.val = sum
            } else if sum == 10 {
                carry = 1
                referenceNode.val = 0
            } else {
                carry = 1
                referenceNode.val = sum%10
            }
            
            if l1N != nil {
                l1N = l1N!.next
            }
            
            if l2N != nil {
                l2N = l2N!.next
            }
        }
        
        if carry > 0 {
            referenceNode.next = ListNode(carry)
        }
        return resultNode.next
    }
    
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
           if l1 == nil {
               return l2
           }
           
           if l2 == nil {
               return l1
           }
           
           if l1 == nil && l2 == nil {
               return nil
           }
           
           var referenceNode = ListNode(0)
           var mainNode = referenceNode
           var l1Node = l1
           var l2Node = l2
        
           while(l1Node != nil || l2Node != nil) {
               
               if l1Node != nil {
                debugPrint("ADDING: \(l1Node!.val)")
                   mainNode.next = ListNode(l1Node!.val)
                   mainNode = mainNode.next!
               }
               
               if l2Node != nil {
                 debugPrint("ADDING: \(l2Node!.val)")
                   mainNode.next = ListNode(l2Node!.val)
                   mainNode = mainNode.next!
               }
              
               if l1Node != nil {
                   l1Node = l1Node!.next
               }
               
               if l2Node != nil {
                   l2Node = l2Node!.next
               }
           }
           
           return referenceNode.next
                    
           
       }
    
    var result: ListNode = ListNode(0)
     
     func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
         
     var previous: [ListNode] = []
     var list = head
     var count: Int = 1
     var parser = result
         
         while (list != nil) {
             
             previous.append(list!)
             
             if list != nil {
                 list = list!.next
             }
             
             count += 1
             if count%k == 0 {
                 debugPrint("count is: \(count)")
                 for i in (0..<previous.count).reversed() {
                     debugPrint("reversing node called")
                     parser.next = previous[i]
                     parser = parser.next!
                 }
                 
                 previous = []
             }
         }
         
         if previous.count > 0 {
             for i in 0..<previous.count {
                 parser.next = previous[i]
                 parser = parser.next!
             }
         }
         return result.next
     }
}
class Solution {
    var queue: [ListNode] = []
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var allArrays:[[Int]] = []
        var countString: String = ""
        var sum: Double = 0
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        let l1Node = getNumber(l1!)
        let l2Node = getNumber(l2!)
        
        
        debugPrint(getNumber(l1!))
        debugPrint(getNumber(l2!))
        _ = getNumber(l1!).map{ countString = countString + "\($0)" }
        debugPrint(countString)
    //    debugPrint(Double(countString)! + Double(countString)!)
        sum = sum + Double(countString)!
        countString = ""
        _ = getNumber(l2!).map{countString = countString + "\($0)"}
        sum = sum + Double(countString)!
//
       debugPrint(sum)
        let dataArr = String(sum).compactMap { Int(String($0)) }
         debugPrint(dataArr)
//
        var node: ListNode?
//        for i in 0...dataArr.count-1 {
//            node = createListNode(node, dataArr[i])
//        }
        
        return node
    }
    
    func createListNode(_ oldNode: ListNode?,_ value: Int) -> ListNode {
        let listNode = ListNode(value)
        listNode.next = oldNode
        return listNode
    }
    
    
    
    func getNumber(_ list: ListNode) -> [Int] {
        queue.append(list)
        var sum: [Int] = []
        while !queue.isEmpty {
            let topElement = queue.removeFirst()
            sum.append(topElement.val)
            if topElement.next != nil {
                queue.append(topElement.next!)
            }
        }
        return sum.reversed()
    }
}

var l1 = [1,2]
var l2 = [1]
let solution = Solution()
let solution2 = Solution2()
var l1Node : ListNode?
for l in l1 {
    l1Node = solution.createListNode(l1Node, l)
}

var l2Node : ListNode?
for l in l2 {
    l2Node = solution.createListNode(l2Node, l)
}

debugPrint(solution2.reverseKGroup(l1Node,2))

