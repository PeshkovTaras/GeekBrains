//
//  main.swift
//  Lesson-6
//
//  Created by Тарас Пешков on 25.09.2021.
//

import Foundation

enum UserSex {
    case male
    case female
}

//MARK: - Generic

struct StackGeneric <T> {
    var genericArray: [T] = []
    
    mutating func pushItem(_ newItem: T) {
        genericArray.append(newItem)
    }
    
    mutating func deleteLastItem() {
        genericArray.removeLast()
    }
    
    mutating func deleteFirstItem() {
        genericArray.removeFirst()
    }
    
    func printStack() {
        for i in genericArray {
            print(i)
        }
    }
    
    subscript(index: Int) -> String {
        if index < genericArray.endIndex {
            return "Индекс \(index) существует в этом массиве"
        }
        return "Ошибка: индекса \(index) в данном массиве нет"
    }
}

extension StackGeneric {
    func myFilter(complition: (T) -> Bool) -> [T] {
        var resultArray: [T] = []
        for i in genericArray {
            if complition(i) {
                resultArray.append(i)
            }
        }
        return resultArray
    }
}

//MARK: - User

final class User {
    let name: String
    let age: Int
    let sex: UserSex
    let isBan: Bool
    
    init(name: String,
         age: Int,
         sex: UserSex,
         isBan: Bool)
    {
        self.name = name
        self.age = age
        self.sex = sex
        self.isBan = isBan
    }
}

extension User: CustomStringConvertible {
    var description: String {
        return "User: \(name), age: \(age), sex: \(sex), ban: \(isBan)"
    }
}

//MARK: - Rectangle

final class Rectangle {
    let sideA: Double
    let sideB: Double
    
    var perimetr: Double {
        (sideA + sideB) * 2
    }
    
    init(sideA: Double,
         sideB: Double)
    {
        self.sideA = sideA
        self.sideB = sideB
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        return "Сторона А = \(sideA), сторона B = \(sideB), периметр = \(perimetr)"
    }
}

//MARK: - stackUser

var stackUsers = StackGeneric<User>()

stackUsers.pushItem(User(name: "John",
                         age: 23,
                         sex: .male,
                         isBan: false))

stackUsers.pushItem(User(name: "Sara",
                         age: 31,
                         sex: .female,
                         isBan: true))

stackUsers.pushItem(User(name: "Adam",
                         age: 26,
                         sex: .male,
                         isBan: false))

stackUsers.pushItem(User(name: "Kevin",
                         age: 43,
                         sex: .male,
                         isBan: true))

print(stackUsers[2])

stackUsers.printStack()

print(stackUsers.myFilter { $0.isBan == true })

//MARK: - stackRectangle

var stackRectangle = StackGeneric<Rectangle>()

stackRectangle.pushItem(Rectangle(sideA: 10,
                                  sideB: 10))

stackRectangle.pushItem(Rectangle(sideA: 7,
                                  sideB: 5))

stackRectangle.pushItem(Rectangle(sideA: 9,
                                  sideB: 3))

stackRectangle.pushItem(Rectangle(sideA: 10,
                                  sideB: 70))

stackRectangle.printStack()

print(stackRectangle.myFilter { $0.sideA > 10 })

print(stackRectangle[5])

