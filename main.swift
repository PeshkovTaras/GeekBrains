//
//  main.swift
//  Lesson-2
//
//  Created by Тарас Пешков on 11.09.2021.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет

func chetNeChet(someNumber: Int) {
    if someNumber % 2 == 0 {
        print("\(someNumber) - Чётное число")
    }
    else {
        print("\(someNumber) - Не четное число")
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3

func ostatokOtDel(someNumber: Int) {
    if someNumber % 3 == 0 {
        print("\(someNumber) - Делится без остатка на 3")
    }
    else{
        print("\(someNumber) - Не делится без отсатка на 3")
    }
}

print("Введите целое число")

if let input = readLine() {
    if let input_num = Int(input) {
        chetNeChet(someNumber: input_num)
        ostatokOtDel(someNumber: input_num)
    }
    else {
        print("Ошибка, необходимо ввести целое число")
    }
}


//3. Создать возрастающий массив из 100 чисел.

var upperArray: [Int] = []
for i in 0...100 {
    upperArray.append(i)
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var arrayNeChet: [Int] = []
for element in upperArray {
    if element % 2 != 0 {
        arrayNeChet.append(element)
    }
}
upperArray = arrayNeChet
print(upperArray)


//5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

var fiboArray: [Int] = [0, 1]

func fiboNum(anyArray: [Int], numberOfIteration: Int) -> [Int] {
    var funcArray:[Int] = anyArray
    for _ in 0...numberOfIteration{
        let lastIndex = funcArray.count-1
        let previosIndex = funcArray.count-2
        let result = funcArray[lastIndex] + funcArray[previosIndex]
        funcArray.append(result)
    }
    return funcArray
}

print(fiboNum(anyArray: fiboArray, numberOfIteration: 50))

//6. * Заполнить массив из 100 элементов различными простыми числами.

let num = 100
var prostoArray: [Int] = []

func prostoChislo(number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for i in 1...num {
    if prostoChislo(number: i) {
        prostoArray.append(i)
    }
}
print(prostoArray)

