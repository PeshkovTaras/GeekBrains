//
//  main.swift
//  HomeWork-5
//
//  Created by Тарас Пешков on 22.09.2021.
//

import Foundation

//MARK: enums

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

//MARK: protocol CarProtocol

protocol CarProtocol {
    var color: Color { get }
    var fuelType: FuelType { get }
    var transmission: Transmission { get }
    var isDoorOpen: Bool { get set }
    var isWindowOpen: Bool { get set}
}

//MARK: extensions

extension CarProtocol {
    mutating func openWindow() {
        if isWindowOpen {
            return print("Окна уже открыты!")
        } else {
            isWindowOpen = true
            return print("Окна были открыты")
        }
    }
}

extension CarProtocol {
    mutating func closeWindow() {
        if isWindowOpen {
            isWindowOpen = false
            return print("Окна были закрыты")
        } else {
            return print("Окна уже закрыты!")
        }
    }
}

extension CarProtocol {
    mutating func openDoor() {
        if isDoorOpen {
            print("Двери уже открыты!")
        } else {
            isDoorOpen = true
            print("Двери были открыты")
        }
    }
}

extension CarProtocol {
    mutating func closeDoor() {
        if isDoorOpen {
            isDoorOpen = false
            print("Двери были закрыты")
        } else {
            print("Двери уже были закрыты!")
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return ("""
                Марка: \(mark)
                Цвет: \(color)
                Тип топлива: \(fuelType)
                Тип трансмиссии: \(transmission)
                """)
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return ("""
                Марка: \(mark)
                Цвет: \(color)
                Тип топлива: \(fuelType)
                Тип трансмиссии: \(transmission)
                """)
    }
}

// MARK: class SportCar

final class SportCar: CarProtocol {
    var mark: MarkSport
    var transmission: Transmission
    var color: Color
    var fuelType: FuelType
    var isDoorOpen: Bool
    var isWindowOpen: Bool

    init(mark: MarkSport,
         transmission: Transmission,
         color: Color,
         fuelType: FuelType,
         isDoorOpen: Bool,
         isWindowOpen: Bool) {
        self.mark = mark
        self.transmission = transmission
        self.color = color
        self.fuelType = fuelType
        self.isDoorOpen = isDoorOpen
        self.isWindowOpen = isWindowOpen
    }
}

//MARK: class TrunkCar

final class TrunkCar: CarProtocol {
    var mark: MarkTrunk
    var color: Color
    var fuelType: FuelType
    var transmission: Transmission
    var isDoorOpen: Bool
    var isWindowOpen: Bool

    init(mark: MarkTrunk,
         color: Color,
         fuelType: FuelType,
         transmission: Transmission,
         isDoorOpen: Bool,
         isWindowOpen: Bool) {
        self.mark = mark
        self.color = color
        self.fuelType = fuelType
        self.transmission = transmission
        self.isDoorOpen = isDoorOpen
        self.isWindowOpen = isWindowOpen
    }
}

var someTrunkCar = TrunkCar(mark: .Bongo,
                            color: .black,
                            fuelType: .diesel,
                            transmission: .auto,
                            isDoorOpen: true,
                            isWindowOpen: false)

var someSportCar = SportCar(mark: .Accord,
                            transmission: .auto,
                            color: .purple,
                            fuelType: .gasoline,
                            isDoorOpen: false,
                            isWindowOpen: true)

someTrunkCar.openDoor()
someTrunkCar.closeDoor()
someSportCar.openWindow()
someSportCar.closeWindow()

print(someTrunkCar.description)
print(someSportCar.description)

