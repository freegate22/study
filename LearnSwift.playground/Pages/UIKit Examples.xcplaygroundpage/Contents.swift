//: [Previous](@previous)

//import Foundation
import UIKit
import PlaygroundSupport

var index: Int?

index = 3
if index != nil {
    print(index!)
} else {
    print("b")
}


if index != nil {
    print(index!)
} else {
    print("b")
}

let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
myLabel.backgroundColor = UIColor.red
myLabel.text = "Hello Swift"
myLabel.textAlignment = .center
myLabel.font = UIFont(name: "Gergia", size: 24)

let image = UIImage(named: "waterfall.png")

let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

PlaygroundPage.current.liveView = container

container.backgroundColor = UIColor.white
let square = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
square.backgroundColor = UIColor.red

container.addSubview(square)

UIView.animate(withDuration: 5.0, animations: {
    square.backgroundColor = UIColor.blue
    let rotation = CGAffineTransform(rotationAngle: 3.14)
    square.transform = rotation
})


func message( name: String, count: Int) -> String{
    var name = name
    name = name + " !"
    return("\(name), ye")
}


message(name: "ya",count: 1)

func sizeConverter(length: Float) -> (yards: Float, centimeters: Float, meters: Float){
    let yards = length * 0.02777778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    
    return (yards, centimeters, meters)
}

let lengthTuple = sizeConverter(length: 20)

print(lengthTuple.yards)
print(lengthTuple.centimeters)
print(lengthTuple.meters)


func displayStrings(strings: String...){
    for string in strings{
        print(string)
    }
}

displayStrings(strings: "one","two","three")


var myValue = 10
func doubleValue(value: inout Int) -> Int{
    value += value
    return(value)
}

print("Before = \(myValue)")
print("call = \(doubleValue(value: &myValue))")
print("After = \(myValue)")

func inchesToFeet(inches: Float) -> Float{
    return inches * 0.833333
}
func inchesToYards(inches: Float) -> Float{
    return inches * 0.0277778
}

let toFeet = inchesToFeet
let toYards = inchesToYards
let result = toFeet(10)

func outputConversion(converterFunc: (Float) -> Float, value: Float){
    let result = converterFunc(value)
    print("result \(result)")
}

outputConversion(converterFunc: toFeet, value: 10)


func decideFunction(feet: Bool) -> (Float) -> Float{
    if feet {
        return toFeet
    } else {
        return toYards
    }
}

let sayHello = { print("Hello") }
sayHello()

let multiply = {
    (val1: Int, val2: Int) -> Int in
    return val1 * val2
}
let res = multiply(10, 20)

func funcA() -> () -> Int{
    var counter = 0
    
    func funcB() -> Int{
        return counter + 10
    }
    return funcB
}

let myClosure = funcA()
let resultClosure = myClosure()


//: [Next](@next)


