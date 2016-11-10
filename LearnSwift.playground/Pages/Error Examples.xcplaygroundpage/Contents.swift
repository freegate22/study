//: [Previous](@previous)

import Foundation

let connectionOK = true
let connectionSpeed = 30.00
let fileFound = false

enum FileTransferError: Error {
    case NoConnection
    case LowBandwidth
    case FileNotFount
}

func fileTransfer() throws {
    
    guard connectionOK else {
        // connectionOK 이 false인 경우
        throw FileTransferError.NoConnection
    }
    
    guard connectionSpeed > 30 else {
        // connectionSpeed <= 30 인 경우
        throw FileTransferError.LowBandwidth
    }
    
    guard fileFound else {
        throw FileTransferError.FileNotFount
    }
    
}

func sendFile() -> String{
    
    // defer : 제어권을 반환하기 전에 곧바로 실행
    // catch에서 return하기 직전에 호출되는 것으로 보임
    defer {
        //removeTmpFiles()
        //closeConnection()
    }
    
    do {
        try fileTransfer()
    } catch FileTransferError.NoConnection{
        return("No Network Connection")
    } catch FileTransferError.LowBandwidth{
        return("File Transfer Speed too Low")
    } catch FileTransferError.FileNotFount{
        return("File not Found")
    } catch {
        return("Unknown error")
    }
    
    return("Succesful transfer")
}

do{
//    try ...
} catch let error as Error {
    print("Error: \(error.localizedDescription)")
}

// do catch구문에서 메서드가 호출되도록 감싸지 않아도 스로잉 메서드가 강제 실행
// 가급적 사용하지 않는것이 좋다.
try! fileTransfer


//: [Next](@next)
