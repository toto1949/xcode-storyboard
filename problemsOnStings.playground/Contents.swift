import UIKit

func groupStrings(_ arr : [String]) -> [Int : [String]]{
    return Dictionary(grouping: arr, by: {$0.count})
}
let inputData = ["swift"," function","laptop","phone"]
let output  = groupStrings(inputData)
print(output)



func latgestString(_ arr : [String]) -> String{
    let arrCouts = arr.map{$0.count}
    let largestString  = arrCouts.max()
    return arr.filter{$0.count == largestString}.first ?? ""
}
print(latgestString(["laptop","car","screen", "city"]))


func hasVowels(_ arr : [String]) -> [String]{
    let vowels = "aeiuoAEUOI"
   return arr.filter{
        let firstChar = $0.first
        return vowels.contains(firstChar!)
   }.map{$0.capitalized}
}
print(hasVowels(["apple", "mac", "android"]))


func filterPalindromes(_ arr : [String]) -> [String] {
    return arr.filter{$0 == String($0.reversed())}
}
let inputStrings  = ["level", "radar", "swift", "apple"]
print(filterPalindromes(inputStrings))
