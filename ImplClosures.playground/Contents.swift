var addThreeNumbers = { (_ num1 : Int,_ num2 : Int,_ num3 : Int ) -> Int in
    return num1 + num2 + num3
}
print(addThreeNumbers(1,2,3))

var multTwoNumbers = { (_ num1 : Int, num2 : Int)-> Int in
return num1 * num2
}
print(multTwoNumbers(5,8))

var converCelsiusToFehrenheit = {(_ degree : Double) ->Double in
return (degree * (9/5)) + 32
}
print(converCelsiusToFehrenheit(2))
