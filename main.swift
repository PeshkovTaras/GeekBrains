//
//  main.swift
//  Lesson-7
//
//  Created by Тарас Пешков on 29.09.2021.
//

import Foundation

enum myError: Error {
    case emptyBase
    case userNotFound
}

enum UserSex {
    case male
    case female
}

struct User {
    let userId: Int
    let name: String
    let nicName: String
    let sex: UserSex
    let age: Int
    var isBan: Bool
}

extension myError: CustomStringConvertible {
    var description: String {
        switch self {
        case .userNotFound:
            return "Пользователь не найден!"
        case .emptyBase:
            return "База пользователей пуста!"
        }
    }
}

extension User: CustomStringConvertible {
    var description: String {
        """
user ID: \(userId)
Name: \(name)
NicName: \(nicName)
Пол: \(sex)
Возраст: \(age)
Бан: \(isBan)
"""
    }
}

let userIvan = User(userId: 102,
                    name: "Ivan",
                    nicName: "Iv-23",
                    sex: .male,
                    age: 23,
                    isBan: false)

let userAnton = User(userId: 276,
                     name: "Anton",
                     nicName: "Anton21",
                     sex: .male,
                     age: 43,
                     isBan: true)

let userIgor = User(userId: 431,
                    name: "Igor",
                    nicName: "Ig54",
                    sex: .male,
                    age: 34,
                    isBan: false)

struct StackUsers {
    
    var usersBase: [User] = [userIvan, userAnton, userIgor]
    
    func userFindId(idUser id: Int) throws {
        guard usersBase.count > 0 else { throw myError.emptyBase }
        guard usersBase.contains(where: {$0.userId == id}) else { throw myError.userNotFound}
        
        usersBase.forEach {
            if $0.userId == id {
                print($0)
            }
        }
    }
    
    mutating func userDelete(idUser id: Int) throws {
        guard usersBase.contains(where: {$0.userId == id}) else { throw myError.userNotFound}
        
        for (index, value) in usersBase.enumerated() where value.userId == id {
            usersBase.remove(at: index)
            print("User \(id) удалён из базы")
        }
    }
}

var uBase = StackUsers()

do {
    try uBase.userFindId(idUser: 276)
    try uBase.userDelete(idUser: 276)
    try uBase.userDelete(idUser: 431)
    try uBase.userFindId(idUser: 276)
}
catch let error as myError {
    print(error)
}

func division(numberA: Int, numberB: Int) -> Int {
    guard numberB != 0 else { return 0 }
    let result = numberA / numberB
    return result
}

print(division(numberA: 10, numberB: 0))

