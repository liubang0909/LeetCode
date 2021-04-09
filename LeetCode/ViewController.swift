//
//  ViewController.swift
//  LeetCode
//
//  Created by 刘邦 on 2021/2/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        
        //        let node1 = ListNode(1)
        //        let node2 = ListNode(2)
        //        let node3 = ListNode(3)
        //        let node4 = ListNode(4)
        //        node1.next = node2
        //        node2.next = node3
        //        node3.next = node4
        //       print(self.hasCycle(node1))
        
        //        print(self.buildTree([3,9,20,15,7], [9,3,15,20,7]) as Any)
        
        //        print(self.sortedArrayToBST([-10,-3,0,5,9]) as Any)
        
        //二叉树的深度 测试数据
        //        let root : TreeNode = TreeNode(3);
        //        let node1 : TreeNode = TreeNode(9);
        //        let node2 : TreeNode = TreeNode(20);
        //        let node3 : TreeNode = TreeNode(15);
        //        let node4 : TreeNode = TreeNode(7);
        //        root.left = node1;
        //        root.right = node2;
        //        node2.left = node3;
        //        node2.right = node4;
        //        3,9,20,null,null,15,7
        //        print(self.maxDepth(root))
        
        //合并二叉树  测试数据
        
        //                let root1 : TreeNode = TreeNode(1);
        //                let node1 : TreeNode = TreeNode(3);
        //                let node2 : TreeNode = TreeNode(2);
        //                let node3 : TreeNode = TreeNode(5);
        //                root1.left = node1;
        //                root1.right = node2;
        //                node2.left = node3;
        //
        //        let root2 : TreeNode = TreeNode(2);
        //        let node4 : TreeNode = TreeNode(1);
        //        let node5 : TreeNode = TreeNode(3);
        //        let node6 : TreeNode = TreeNode(4);
        //        let node7 : TreeNode = TreeNode(7);
        //
        //        root2.left = node4;
        //        root2.right = node5;
        //        node4.right = node6;
        //        node5.right = node7;
        //        print(self.mergeTrees(root1, root2) as Any)
        
        //二叉树的镜像 测试数据
        //        let root: TreeNode = TreeNode(4)
        //        let root1: TreeNode = TreeNode(2)
        //        let root2: TreeNode = TreeNode(7)
        //        root.left = root1
        //        root.right = root2
        //        let root3: TreeNode = TreeNode(1)
        //        let root4: TreeNode = TreeNode(3)
        //        root1.left = root3
        //        root1.right = root4
        //        let root5: TreeNode = TreeNode(6)
        //        let root6: TreeNode = TreeNode(7)
        //        root2.left = root5
        //        root2.right = root6
        //        print(self.mirrorTree(root) as Any)
        
        //平衡二叉树 测试数据
        // [3,9,20,null,null,15,7]
//
//        let root : TreeNode = TreeNode(3);
//        let root1: TreeNode = TreeNode(9);
//        let root2: TreeNode = TreeNode(20);
//        root.left = root1;
//        root.right = root2;
//        let root3: TreeNode = TreeNode(15);
//        let root4: TreeNode = TreeNode(7);
//        root2.left = root3;
//        root2.right = root4;
//
        
        //[1,2,2,3,3,null,null,4,4]
//        let tempRoot:TreeNode = TreeNode(1);
//        let tempRoot1:TreeNode = TreeNode(2);
//        let tempRoot2:TreeNode = TreeNode(2);
//        tempRoot.left = tempRoot1;
//        tempRoot.right = tempRoot2;
//        let tempRoot3:TreeNode = TreeNode(3);
//        let tempRoot4:TreeNode = TreeNode(3);
//        tempRoot1.left = tempRoot3;
//        tempRoot1.right = tempRoot4;
//        let tempRoot5:TreeNode = TreeNode(4);
//        let tempRoot6:TreeNode = TreeNode(4);
//        tempRoot3.left = tempRoot5;
//        tempRoot3.right = tempRoot6;
//
//
//        print(self.isBalanced(root));
//        print(self.isBalanced(tempRoot));
//
     //   翻转二叉树 测试数据
        
//        let root : TreeNode = TreeNode(4);
//        let root1: TreeNode = TreeNode(2);
//        let root2: TreeNode = TreeNode(7);
//        root.left = root1;
//        root.right = root2;
//        let root3: TreeNode = TreeNode(1);
//        let root4: TreeNode = TreeNode(3);
//        root2.left = root3;
//        root2.right = root4;
//        let root5: TreeNode = TreeNode(6);
//        let root6: TreeNode = TreeNode(9);
//        root3.left = root5;
//        root3.right = root6;
//        print(self.invertTree(root)as Any);
        
        
        
    }
    
    
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
    
    // MARK: -  翻转二叉树
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {

        if(root == nil)
        {
            return nil
        }
        let endRoot : TreeNode = TreeNode(root?.val ?? 0);
        if root?.left != nil{
            
            endRoot.right =  self.invertTree(root?.left)
        }
        if root?.right != nil{
            
            endRoot.left =  self.invertTree(root?.right)
        }
        
        return endRoot
        
    }
    
    
    
    
    
    
    
    
    // MARK: -  平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil
        {
            return true
        }
        
        let leftDepth = self.treeDepth(root?.left);
        let rightDepth = self.treeDepth(root?.right);

        return abs(leftDepth - rightDepth) <= 1 && self.isBalanced(root?.left) && isBalanced(root?.right);

    }
    
    func treeDepth(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        return  max(self.treeDepth(root?.left), self.treeDepth(root?.right))+1
        
    }
    
    
    
    
    
    // MARK: -  二叉树的镜像
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        
        if(root == nil)
        {
            return nil
        }
        
        let endRoot : TreeNode = TreeNode(root?.val ?? 0);
        
        if root?.left != nil {
            endRoot.right = self.mirrorTree(root?.left)
        }
        if (root?.right != nil)
        {
            endRoot.left = self.mirrorTree(root?.right)
        }
        
        return   endRoot
        
        
        
        
        
    }
    
    
    
    
    
    
    // MARK: - 合并二叉树
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        
        if root1 == nil{
            
            return root2
        }
        if root2 == nil {
            
            return root1
        }
        
        
        let root: TreeNode = TreeNode((root1?.val ?? 0 ) + (root2?.val ?? 0 ) )
        
        root.left = self.mergeTrees(root1?.left, root2?.left)
        root.right = self.mergeTrees(root1?.right, root2?.right)
        
        return root
        
    }
    
    
    
    
    
    
    // MARK: - 二叉树的深度
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return  max(self.maxDepth(root?.left),self.maxDepth(root?.right))+1
    }
    
    
    
    
    
    // MARK: - 最小高度树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        let arrayLength = nums.count
        if arrayLength <= 0
        {
            return nil
        }
        
        let m = arrayLength/2
        let root:TreeNode  = TreeNode(nums[m])
        root.left = self.sortedArrayToBST(Array(nums.prefix(m)))
        if(arrayLength%2 == 0)
        {
            root.right = self.sortedArrayToBST(Array(nums.suffix(m - 1)))
        }
        else
        {
            root.right = self.sortedArrayToBST(Array(nums.suffix(m)))
        }
        return root
        
        
    }
    
    
    
    
    
    
    
    //    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    //
    //        let rootNode = TreeNode(preorder[0])
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //        return rootNode
    //    }
    
    
    
    
    
    
    // MARK: - 判断链表是否有环
    
    func hasCycle(_ head: ListNode?) -> Bool {
        
        //空的或者只有一个的没有环
        if head == nil || head?.next == nil {
            return false
        }
        
        
        var slow = head
        var fast = head?.next
        
        while fast != nil, fast?.next != nil {
            
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
            
        }
        
        return false
    }
    
    
    
    
    
    
    
    
    
    // MARK: - 删除排序数组中的重复项
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        if (nums.count == 0) { return 0 }
        var i = 0
        for j in 1..<nums.count {
            if (nums[i] != nums[j]) {
                i = i + 1
                nums[i] = nums[j]
            }
        }
        return (i + 1)
        
    }
    
    
    
    
    
    
    
    // MARK: - 有效的括号
    
    func isValid(_ s: String) -> Bool {
        
        if(s.count%2 != 0 || s.count == 0 )
        {
            return false
        }
        
        var  array = [Character]()
        
        for char in s {
            
            if(char == "(")
            {
                array.append(")")
            }
            if(char == "{")
            {
                array.append("}")
            }
            if(char == "[")
            {
                array.append("]")
            }
            if(char == "]" || char == "}" || char == ")")
            {
                print(array)
                
                if  array.contains(char) && array.last == char {
                    
                    array.remove(at: array.count-1)
                }
                else // 说明栈里没有可以匹配的
                {
                    return false
                }
                
            }
        }
        if(array.count>0)
        {
            return false
        }
        
        
        return true
        
    }
    
    
    
    
    
    
    
    
    
    // MARK: - 最长公共前缀
    
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        
        if(strs.count==0)
        {
            return ""
        }
        
        if(strs.count==1)
        {
            return strs[0]
        }
        
        var pubStr = ""
        var tempStr = ""
        
        var flag = false
        
        let firstStr = strs[0]
        
        for index in 0...firstStr.count{
            
            if flag
            {
                break
            }
            
            let tempIndex = firstStr.index(firstStr.startIndex, offsetBy: index)
            tempStr = String(firstStr[firstStr.startIndex..<tempIndex])
            
            for  (strIndex ,str) in strs.enumerated() {
                
                if(!str.hasPrefix(tempStr))
                {
                    flag = true
                    break
                }
                if(strIndex == strs.count - 1)
                {
                    
                    pubStr = tempStr
                }
                
            }
            
        }
        
        return pubStr
    }
    
    
    
    // MARK: - 整数转罗马数字
    func intToRoman(_ num: Int) -> String {
        
        
        var tempNum = num
        
        var endStr = ""
        let keys = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        let valueArray = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        
        
        for  (index,key) in keys.enumerated() {
            if(tempNum==0)
            {
                break
            }
            let count = tempNum/key
            if count>0
            {
                endStr.append(String(repeating:valueArray[index], count: count))
            }
            tempNum = tempNum % key
            
        }
        
        return endStr
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - 合并两个有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var flag = false
        if(nums1.count == m+n)
        {
            flag = true
        }
        for  (index,value) in nums2.enumerated() {
            if flag
            {
                nums1[m+index] = value;
                
            }
            else
            {
                nums1.append(value)
                
            }
        }
        nums1 = nums1.sorted(by:<)
        
        
    }
    
    
    
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        var oldHead = head
        var newHead:ListNode? = nil
        
        while oldHead != nil {
            
            let temp = oldHead?.next
            oldHead?.next = newHead
            newHead = oldHead
            oldHead = temp
        }
        return newHead
        
    }
    
    
    
    
    
    // MARK: - 字符串反转
    func reverseString(_ s: inout [Character]) {
        
        
        var  maxIndex = s.count/2-1
        if(s.count<=1)
        {
            return
        }
        
        if(s.count%2 != 0)
        {
            
            maxIndex = (s.count-1)/2-1
        }
        
        for index in 0...maxIndex {
            
            let temp = s[s.count-1-index]
            s[s.count-1-index] = s[index]
            s[index] = temp
            
        }
        
        print(s)
        
        
        
    }
    
    
    
    
    
    
    
    
    // MARK: - 罗马数字转整数
    func romanToInt(_ s: String) -> Int {
        
        var tempStr = s
        var sum = 0
        let valueDict = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        let otherValueDict = ["IV":4,"IX":9,"XL":40,"XC":90,"CD":400,"CM":900]
        for (key,value) in otherValueDict {
            
            if(tempStr.contains(key))
            {
                
                tempStr.removeSubrange(tempStr.range(of:key)!)
                sum += value
            }
        }
        
        for char in tempStr {
            
            sum += valueDict[String(char)] ?? 0
        }
        
        return sum
        
        
    }
    
    
    
    // MARK: - 回文数
    
    func isPalindrome(_ x: Int) -> Bool {
        
        
        if(x<0)//负数肯定不是回文数
        {
            return false
        }
        let numberStr = String(x)
        if(numberStr.count==1)
        {
            return true
        }
        let array = Array(numberStr)
        var maxIndex = array.count/2;
        if(array.count%2 != 0)
        {
            maxIndex = array.count/2-1
        }
        
        for index in 0...maxIndex{
            if array[index] != array[array.count-1-index]{
                return false
            }
            
        }
        return true
        
        
        
    }
    
    
    
    
    
    
    // MARK: - 字符串转换整数 (atoi)
    
    func myAtoi(_ s: String) -> Int {
        
        
        //去除空格
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        let noWhitespaceStr = s.trimmingCharacters(in: whitespace)
        
        var sign = 1
        
        var  result = 0
        
        
        for (index, scalars) in noWhitespaceStr.unicodeScalars.enumerated() {
            if ((scalars.value >= 48 && scalars.value <= 57) || (scalars.value == 45 && index == 0)) {
                //如果第一位是字符 - 则标识结果为负数
                if scalars.value == 45 && index == 0 {
                    sign = -1
                    continue
                }
                
                //判断依据：当前结果大于最大值除10 (214748364)
                if result > Int32.max / 10 || (result == Int32.max / 10 && Int(String(scalars))! > 7) {
                    return sign == 1 ? Int(Int32.max) : Int(Int32.min)
                }
                
                result = result * 10 + Int(String(scalars))!
            }else if scalars.value == 43 && index == 0 {
                continue
            }else {
                break
            }
            
        }
        return result * sign
        
    }
    
    
    
    
    
    
    
    
    // MARK: - 无重复字符的最长子串
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var m = 0
        
        var lists:[Character] = []
        
        for sub in s {
            
            m = max(m, lists.count)
            
            if let index = lists.firstIndex(of: sub){
                
                lists.removeSubrange(0...index)
            }
            
            lists.append(sub)
        }
        
        return max(m, lists.count)
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    // MARK: - 整数反转
    
    func reverse(_ x: Int) -> Int {
        
        var numberArray = [Int]()
        var temp = x
        var plus = 1
        if(x<0)
        {
            temp = -x
            plus = -1
            
        }
        
        while true {
            if(temp<10)
            {
                numberArray.append(temp)
                break;
            }
            numberArray.append(temp%10)
            temp = temp/10;
            
            
        }
        print(numberArray)
        var endValue = 0;
        let  spaceValue = Int(pow(2.0,31.0))
        
        for index in 0..<numberArray.count {
            
            endValue +=  numberArray[index] * Int(pow(10.0,Double(numberArray.count-1-index)))
            if(endValue>=spaceValue)
            {
                return 0
            }
        }
        
        
        endValue = endValue * plus;
        
        
        
        if (endValue >= -spaceValue) && (endValue <= spaceValue-1)
        {
            return endValue
            
        }
        
        return 0
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - 两数之和
    func twoSum(_ nums:[Int], _ target:Int ) -> [Int] {
        
        for  index in 0..<nums.count {
            for nextIndex in index+1..<nums.count {
                
                if nums[index]+nums[nextIndex]==target {
                    
                    return [index,nextIndex];
                }
            }
            
        }
        
        return [0,0];
        
        
    }
    
    
    
    
    
}

