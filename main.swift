//
//  main.swift
//  Lessson-3
//
//  Created by Тарас Пешков on 15.09.2021.
//

import Foundation

enum CarTransmission {
    case auto, manual
}

enum SportModel {
    case Fit, Escudo, x5, Mark2, Leaf
}

enum TruckModel {
    case Volvo, Mercedez, Man, Grunwald, Hino
}

enum CarColor {
    case green, red, purple, black, white
}

enum EngineStatus {
    case inWork, stoped
}

struct SportCar {
    let model: SportModel
    let color: CarColor
    let transmission: CarTransmission
    let year: Int
    let gasTank: Int
    let trunkVolume: Int
    let isSpareWheel: Bool
    let km: Int
    var engineStatus: EngineStatus

    var isWindowOpen: Bool {
        didSet {
            self.isWindowOpen == true ? print("У автомобиля \(self.model) открыты окна") :
                print("У автомобиля \(self.model) были закрыты окна")
        }
    }

    var isDoorOpen: Bool {
        didSet {
            self.isDoorOpen == true ?
                print("У автомобиля \(self.model) открыты двери") :
                print("У автомобиля \(self.model) были закрыты двери")
        }
    }

    func about() {
        print("""
            Название модели: \(self.model)
            Цвет: \(self.color)
            Тип трансмиссии: \(self.transmission)
            Год выпуска: \(self.year)
            Объём бензобака: \(self.gasTank) литров
            Объём багажника: \(self.trunkVolume) литров
            Наличие запаски: \(self.isSpareWheel)
            Двери открыты: \(self.isDoorOpen)
            Окна открыты: \(self.isWindowOpen)
            Пробег: \(self.km) км
            """)
    }
}

struct TruckCar {
    let model: TruckModel
    let color: CarColor
    let transmission: CarTransmission
    let year: Int
    let gasTank: Int
    let isTrailer: Bool
    let isSpareWheel: Bool
    let isDoorOpen: Bool
    let km: Int
    var engineStatus: EngineStatus

    mutating func startEngine() {
        if self.engineStatus == .inWork {
            print("Двигатель \(self.model) уже запущен!")
        }
        else {
            self.engineStatus = .inWork
            print("Двигатель \(self.model) запущен!")
        }
    }

    mutating func stopEngine() {
        if self.engineStatus == .stoped {
            print("Двигатель \(self.model) не заведен!")
        }
        else {
            print("Двигатель \(self.model) заглушен!")
            self.engineStatus = .stoped
        }
    }

    func mileage() {
        print("Пробег \(self.model) - \(self.km) км")
    }

    func about() {
        print("""
            Название модели: \(self.model)
            Цвет: \(self.color)
            Тип трансмиссии: \(self.transmission)
            Год выпуска: \(self.year)
            Объём бензобака: \(self.gasTank) литров
            Прицеп: \(self.isTrailer)
            Наличие запаски: \(self.isSpareWheel)
            Двери открыты: \(self.isDoorOpen)
            Пробег: \(self.km) км
            """)
    }
}

var hondaCar = SportCar(model: .Fit, color: .green, transmission: .manual, year: 2015, gasTank: 45, trunkVolume: 215, isSpareWheel: true, km: 125000, engineStatus: .stoped, isWindowOpen: true, isDoorOpen: false)

var toyotaCar = SportCar(model: .Mark2, color: .black, transmission: .auto, year: 2019, gasTank: 55, trunkVolume: 320, isSpareWheel: true, km: 32343, engineStatus: .stoped, isWindowOpen: true, isDoorOpen: false)

var mazdaCar = SportCar(model: .x5, color: .green, transmission: .auto, year: 1998, gasTank: 70, trunkVolume: 350, isSpareWheel: true, km: 456787, engineStatus: .stoped, isWindowOpen: true, isDoorOpen: false)

var nissanCar = SportCar(model: .Leaf, color: .purple, transmission: .auto, year: 2012, gasTank: 45, trunkVolume: 220, isSpareWheel: true, km: 65098, engineStatus: .inWork, isWindowOpen: false, isDoorOpen: true)

var suzukiCar = SportCar(model: .Escudo, color: .black, transmission: .manual, year: 2018, gasTank: 35, trunkVolume: 210, isSpareWheel: true, km: 23451, engineStatus: .inWork, isWindowOpen: true, isDoorOpen: false)

var truckVolvo = TruckCar(model: .Volvo, color: .red, transmission: .manual, year: 2020,
                          gasTank: 200,isTrailer: true, isSpareWheel: true, isDoorOpen: false,
                          km: 20000, engineStatus: .inWork)

var truckMercedez = TruckCar(model: .Mercedez, color: .green, transmission: .auto, year: 2014,
                             gasTank: 340, isTrailer: false, isSpareWheel: false, isDoorOpen: true,
                             km: 30765, engineStatus: .stoped)

var truckGrunwald = TruckCar(model: .Grunwald, color: .black, transmission: .manual, year: 1990,
                             gasTank: 450, isTrailer: true, isSpareWheel: true, isDoorOpen: false,
                             km: 450000, engineStatus:.inWork)

var truckMan = TruckCar(model: .Man, color: .purple, transmission: .auto, year: 2015,
                        gasTank: 380000, isTrailer: false, isSpareWheel: false, isDoorOpen: false,
                        km: 32674, engineStatus: .stoped)

var truckHino = TruckCar(model: .Hino, color: .white, transmission: .manual, year: 2019,
                         gasTank: 450, isTrailer: true, isSpareWheel: true, isDoorOpen: false,
                         km: 32765, engineStatus:.inWork)

hondaCar.about()

