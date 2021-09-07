//
//  main.swift
//  1l_Peshkov_Taras.
//
//  Created by Тарас Пешков on 07.09.2021.
//

import Foundation
import SwiftUI

//решение квадратного уравнения ax2+bx+c=0

let a: Double = 4
let b: Double = 21
let c: Double = 5

let discr = pow(b, 2)-4*a*c //находим дискриминант по формуле D=b2-4ac

if discr < 0{
    print("Дискриминант <0, уравнение не имеет корней")
}

if discr == 0{
    print("Дискриминант = 0, уравнение имеет один корень")
    
    let x1 = -b/(2*a)
    
    print("X = \(x1)")
    
}

if discr > 0{
    print("Дискриминант > 0, уравнение имеет два корня")
    
    let x1 = (-b + sqrt(discr))/(2*a)
    let x2 = (-b - sqrt(discr))/(2*a)

    print("X1 = \(x1)")
    print("X2 = \(x2)")
}

//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let katetA: Double = 10
let KatetB: Double = 7

let S = (katetA*KatetB)/2 // считаем площадь треугольника

let gipoten = sqrt(pow(katetA, 2) + pow(KatetB, 2)) // считаем гипотенузу

let p = katetA + KatetB + gipoten // считаем периметр треугольника

print("Гипотенуза треугольника = \(gipoten)")
print("Площадь треугольника = \(S)")
print("Периметр треугольника = \(p)")

//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let deposit: Double = 100 //сумма вклада
let percent: Double = 10 //годовой процент по депозиту

let periodMounth: Int = 60 // длительность нахождения депозита в банке, месяцев
var sum: Double = deposit
var i = 0

while i<periodMounth{
    sum += (sum*(percent/12))/100
    i += 1
}

print("Сумма на конец вклада: \(sum)")



