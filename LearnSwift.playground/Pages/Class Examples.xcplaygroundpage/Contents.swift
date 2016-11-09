//: Playground - noun: a place where people can play

import UIKit

class BankAccount {
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00
    
    // getter, setter
    var balanceLessFees: Float {
        get {
            return accountBalance - fees
        }
        
        set(newBalance){
            accountBalance = newBalance - fees
        }
    }
    
    
    // 초기화 (생성자)
    init(number: Int, balance: Float){
        accountNumber = number
        accountBalance = balance
    }
    
    // 해제자 ( 인스턴스 해제 직전 수행
    deinit {
        //
    }
    
    // 인스턴스 매서드
    func displayBalance(){
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
        
        // self
        self.accountBalance += 10
    }
    
    
    // 클래스 메서드
    class func getMaxBalance() -> Float {
        return 100000.00
    }
}

// 인스턴스 생성
//var account1: BankAccount = BankAccount()

// 인스턴스 생성 - 초기화 하면서
var account1: BankAccount = BankAccount(number: 123123, balance: 400.54)

var balance1 = account1.balanceLessFees
print(balance1)
account1.balanceLessFees = 12123.12
print(account1.balanceLessFees)


/*:
 # Welcome to Playgrounds
 This is your *first* playground which is intented to demonstrate:
 * The use of **Quck Look**
 * Placing results **in-line** with the code
 */

