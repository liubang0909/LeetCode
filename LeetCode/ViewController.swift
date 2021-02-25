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
        var array = [0,0,1,1,1,2,2,3,3,4]
        print(self.removeDuplicates(&array))

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

