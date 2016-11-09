//: [Previous](@previous)

import Foundation

class BankAccount {
    var accountBalance: Float
    var accountNumber: Int

    init(number: Int, balance: Float){
        accountNumber = number
        accountBalance = balance
    }

    func displayBalance(){
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
}

// 상속받은 클래스
class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate:Float) {
        interestRate = rate
        super.init(number: number, balance: balance)
    }
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    // 오버라이드
    override func displayBalance() {
        super.displayBalance()
        print("Prevailing interest rate is \(interestRate)")
    }
}

var savings1 = SavingsAccount(number: 12311, balance: 600.00, rate: 0.07)

print(savings1.calculateInterest())
savings1.displayBalance()

// 클래스명 없는 상속 - 오버라이딩은 제공하지 않는다.
extension Double {
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

let myValue: Double = 3.0
print(myValue.squared)


//: [Next](@next)
