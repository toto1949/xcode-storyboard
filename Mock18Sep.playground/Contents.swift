import UIKit

var greeting = "Hello, playground"

func sumEvenNumbers(_ arr : [Int]) -> Int {
    var sum = 0
    if arr.isEmpty { return 0}
    for number in arr {
        if number % 2 == 0 {
            sum += number
        }
    }
    return sum
}
func sumSllEventNumbersV2(_ arr : [Int]) -> Int {
    if arr.isEmpty { return 0}
    
    var sum  =  arr.filter {
        $0.isMultiple(of: 2)
    }.reduce(0, + )
    
    return sum
}
let arr = [12,3,6,2,7]
var sum  = sumSllEventNumbersV2(arr)
print("\(sum)")

func startWith(_ s : String) -> Bool {
    let vowels = "aeiouAEIOU"
    return  vowels.contains(s.lowercased().first!)
}
func   hasVowel(_ arr : [String]) -> [String] {
    var result =  arr.filter{
        startWith($0)
    }.map{$0.capitalized}
    return result
}
let inputData = ["cat", "dog", "elephant", "mouse", "ant"]
let result = hasVowel(inputData)
print("\(result)")


func longestString(_ arr : [String] ) -> String{
    
    let coutString =  arr.map{
        $0.count
    }
    let largestCount = coutString.max()!
    let result  = arr.filter{$0.count == Int(largestCount)}
    return result.first ?? ""
}
let inputDataa = ["cat", "dog", "elephant", "mouse", "ant"]
print(longestString(inputDataa))

func grouStrings(_ arr : [String]) -> [Int : [String]]{
    return Dictionary(grouping: arr, by: {$0.count})
}
let strings = ["cat", "dog", "elephant", "bat", "rat"]
let grouped = grouStrings(strings)
print(grouped)

















