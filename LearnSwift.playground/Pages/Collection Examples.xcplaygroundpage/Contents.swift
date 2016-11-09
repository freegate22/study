//: [Previous](@previous)

import Foundation

// 배열 선언 + 할당
var treeArray1 = ["Pine", "Oak","Yew"]
let treeArray2 = ["Pine", "Oak","Yew"]
var treeArray3: [String] = ["Pine", "Oak","Yew"]

// 배열 선언
let pricArray = [Float]()

// 10개 항목 한번에 넣기
var nameArray = [String](repeating: "My String", count:10)
print(nameArray)

// 배열 합치기
var firstArray = ["Red","Green","Blue"]
var secondArray = ["Indigo","Violet"]
var thirdArray = firstArray + secondArray
print(thirdArray)

// 배열 갯수
print(thirdArray.count)

// 배열이 비었는지 확인
print(thirdArray.isEmpty)

// 배열 항목에 접근
print(thirdArray[2])

// 배열 항목 교체
thirdArray[1] = "Redwood"
print(thirdArray)

// 배열 항목 추가
var treeArray = ["Pine", "Oak","Yew"]
treeArray.append("Redwood")
treeArray += ["Redwood"]
treeArray += ["Redwood","Maple","Birch"]
treeArray.insert("Maple", at: 0)

// 배열 항목 제거
treeArray.remove(at: 2)
print(treeArray)

// 배열 반복
for tree in treeArray {
    print(tree)
}

// 타입혼합배열
let mixedArray: [Any] = ["A String", 432, 34.989]
let mixedArray2 = ["A String",432, 34.989] as [Any]

// 타입 혼합배열을 다음과 같이 사용하면 에러 발생
//for obj in mixedArray {
//    print(obj * 10)
//}

// 키밸류 타입
// 선언
var myDict = [Int:String]()

var bookDict = ["100-432112" : "Wind in the Willows1",
                "200-432112" : "Wind in the Willows2",
                "300-432112" : "Wind in the Willows3",
                "400-432112" : "Wind in the Willows4"]

var bookDict2: [String: String] =
                ["100-432112" : "Wind in the Willows1",
                "200-432112" : "Wind in the Willows2",
                "300-432112" : "Wind in the Willows3",
                "400-432112" : "Wind in the Willows4"]

// 갯수
print(bookDict.count)
// 접근 및 수정
print(bookDict["100-432112"])
bookDict["100-432112"] = "Sense and Sensibility"

print(bookDict["100-432112"])
bookDict.updateValue("The Ruins", forKey: "200-432112")

// 추가
bookDict["500-432112"] = "Sense and Sensibility"


// 제거
bookDict["200-432112"] = nil
bookDict.removeValue(forKey: "300-432112" )
print(bookDict)

// 반복
for (bookid, title) in bookDict {
    print("Book ID: \(bookid) Title; \(title)")
}

//: [Next](@next)
