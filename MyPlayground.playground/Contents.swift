//: Playground - noun: a place where people can play

import UIKit

var str = "http://www.naver.com"
let greeting = "Guten Tag!"

if str.hasPrefix("http://")
{
    print("Has prefix")
}


greeting[greeting.startIndex] //Prints G according to text. Fine according to definition.

greeting[greeting.index(before:greeting.endIndex)] //Prints ! according to text. Now if you look at greeting String, the character before endIndex is g. It must print g according to definition.

greeting[greeting.index(after:greeting.startIndex)]