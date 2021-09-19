//
//  main.swift
//  Lesson-4
//
//  Created by Тарас Пешков on 18.09.2021.
//

import Foundation

enum MarkTrunk {
    case Vezel
    case Bongo
    case Sander
}

enum MarkSport {
    case Veeron
    case ModelS
    case Accord
}

enum Transmission {
    case auto
    case manual
}
enum FuelType {
    case gasoline
    case diesel
}

enum Color {
    case white
    case black
    case gray
    case purple
}

enum EngineType {
    case turbo
    case forced
}

enum TrunkVolume {
    case small
    case middle
    case large
}

enum SunRoof {
    case electric
    case manual
    case automat
}

enum RoofRackState {
    case open
    case close
}

enum SunRoofState {
    case open
    case close
}

class Car {
    let model: String
    let transmission: Transmission
    let color: Color
    let fuelType: FuelType
    let maxSpeed: Double
    let numberOfPassenger: Int
    let gasTunkVolume: Double

    func aboutCar() {
        print("""
            Модель: \(model)
            Тип трансмиссии: \(transmission)
            Цвет: \(color)
            Тип топлива: \(fuelType)
            Максимальная скорость \(maxSpeed)
            Количество пассажиров: \(numberOfPassenger)
            Объем бензобака: \(gasTunkVolume)
            """)
    }

    func modelFunc() {
    }

    init(model: String, transmission: Transmission, color: Color, fuelType: FuelType, maxSpeed: Double,
         numberOfPassenger: Int, gasTunkVolume: Double) {
        self.model = model
        self.transmission = transmission
        self.color = color
        self.fuelType = fuelType
        self.maxSpeed = maxSpeed
        self.numberOfPassenger = numberOfPassenger
        self.gasTunkVolume = gasTunkVolume
    }
}

class TrunkCar: Car {
    let mark: MarkTrunk
    let isRoofRack: Bool
    let trunkVolume: TrunkVolume
    var roofRackState: RoofRackState

    override func modelFunc() {
        if roofRackState == .open {
            roofRackState = .close
            print("Багажник на крыше \(mark) закрыт")
        }else {
            roofRackState = .open
            print("Багажник на крыше \(mark) открыт")
        }
    }

    override func aboutCar() {
        print("Марка: \(mark)")
        super.aboutCar()
        print("Состояние багажника на крыше: \(roofRackState)")
    }

    init(mark: MarkTrunk, isRoofRack: Bool, trunkVolume: TrunkVolume, roofRackState: RoofRackState) {
        self.mark = mark
        self.isRoofRack = isRoofRack
        self.trunkVolume = trunkVolume
        self.roofRackState = roofRackState
        super.init(model: "Trunk model", transmission: .auto, color: .white, fuelType: .diesel, maxSpeed: 120,
                   numberOfPassenger: 8, gasTunkVolume: 65)
    }
}

class SportCar: Car {
    let mark: MarkSport
    let sunRoof: SunRoof
    let engineType: EngineType
    var sunRoofState: SunRoofState

    override func aboutCar() {
        print("""
            Марка: \(mark)
            Тип Двигателя: \(engineType)
            """)
        super.aboutCar()
        print("Тип панорамной крыши: \(sunRoof)")
    }

    override func modelFunc() {
        if sunRoofState == .open {
            sunRoofState = .close
            print("Панорамная крыша \(mark) закрыта")
        }else {
            sunRoofState = .open
            print("Панорамная крыша \(mark) открыта")
        }
    }

    init(mark: MarkSport, sunRoof: SunRoof, engineType: EngineType, sunRoofState: SunRoofState) {
        self.mark = mark
        self.sunRoof = sunRoof
        self.engineType = engineType
        self.sunRoofState = sunRoofState
        super.init(model: "Sport model", transmission: .manual, color: .purple, fuelType: .gasoline, maxSpeed: 250, numberOfPassenger: 2,
                   gasTunkVolume: 75)
    }
}

let carBongo = TrunkCar(mark: .Bongo, isRoofRack: true, trunkVolume: .large, roofRackState: .close)
let carModelS = SportCar(mark: .ModelS, sunRoof: .manual, engineType: .turbo, sunRoofState: .close)
let carSander = TrunkCar(mark: .Sander, isRoofRack: true, trunkVolume: .middle, roofRackState: .open)
let carAccord = SportCar(mark: .Accord, sunRoof: .automat, engineType: .forced, sunRoofState: .close)

