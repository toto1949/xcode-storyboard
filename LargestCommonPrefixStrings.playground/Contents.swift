func largestCommonPrefix(_ str : [String]) -> String{
    if str.isEmpty {return ""}
    
    var prefix = str[0]
    
    for s in str {
        while !s.hasPrefix(prefix) {
            prefix = String(prefix.dropLast())
            if prefix.isEmpty {return ""}
            
        }
    }
    return prefix
}
var data  =  ["flower","flow","flight"]

let prefix = largestCommonPrefix(data)

print("the largest commoon prefix is \(prefix)")

var data1 = ["dog","racecar","car"]
let prefix1  = largestCommonPrefix(data1)
print("the largest common prefix is \(prefix1)")

func secondLargestElement(_ arr : [Int]) -> Int? {
    if arr.isEmpty { return nil }
    var max1  =  arr[0]
    var max2 = arr[0]
    
    for  number in arr {
        if number > max1 {
            max2 = max1
            max1 = number
        } else if number > max2 && number != max1 {
            max2 = number
        }
    }
    return max2
}
var dataInput = [2,12,3,6,8,21]
if let max2  = secondLargestElement(dataInput){
    print("the second largest elemeent on the table is \(max2)")
}


func isPalindrome(_ str : String) -> Bool {
    if str.isEmpty {return false }
    var stringToChars = Array(str)
    var left  = 0
    var right  = str.count - 1
    
    while( left < right ){
        if stringToChars[left] != stringToChars[right]{
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
var input  = "RADAR"
var isPali = isPalindrome(input)
print("\(input) is palindrome? \(isPali)")

func numberOfOccurrences(_ input : String) -> [Character : Int]{
    if input.isEmpty {return [:]}
    var countEachChar : [Character : Int] = [:]
    
    for c in input {
        countEachChar[c,default: 0] += 1
    }
    return countEachChar
}
let inputData = "test"
let result  = numberOfOccurrences(inputData)
print("each element with number of occurrences  \(result)")


















