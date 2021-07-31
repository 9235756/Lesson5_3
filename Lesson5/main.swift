//
//  main.swift
//  Lesson5
//
//  Created by Andrei Naumenko on 31.07.2021.
//

import Foundation

enum Light {            //свет фар вкл/откл
    case On, Off
}

enum Tent {            // Тент откр/закр
    case Open, Close
}

enum Spoler {            //спойлер открыт/закрыт
    case Open, Close
}

protocol CarProtocol: AnyObject {
    
    var brand: String {get}
    var year: Int {get}
    var color: String {get}
    var light: Light {get set}
    
    func actionLight(light: Light)      //функция включения и выключения света
}

extension CarProtocol {                 //Расширяем протокол
    func actionLight (light: Light){
        switch light {
        case .On:
            if self.light == .On {
            print("Свет уже включен")
            }
            else {
            print("Свет включен")
            self.light = .On
            }
        case .Off:
            if self.light == .Off {
            print("Свет уже отключен")
            }
            else {
            print("Свет отключен")
            self.light = .Off
            }
        }
    }
}

class SportCar: CarProtocol {
    var brand: String
    var year: Int
    var color: String
    var light: Light
    var spoler: Spoler
    
    init(brand: String,
         year: Int,
         color: String,
         light:Light,
         spoler: Spoler) {
        self.brand = brand
        self.year = year
        self.color = color
        self.light = light
        self.spoler = spoler
    }
   
    func actionSpoler (spoler: Spoler){         //функция открытия и закрытия сполера
        switch spoler {
        case .Open:
            if self.spoler == .Open {
            print("Спойлер уже поднят/открыт")
            }
            else {
            print("Спойлер поднят/открыт")
                self.spoler = .Open
            }
        case .Close:
            if self.spoler == .Close {
            print("Спойлер уже опущен/закрыт")
            }
            else {
            print("Спойлер опущен/закрыт")
                self.spoler = .Close
            }
        
        
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(brand) | \(year) | \(color) | фары \(light) | спойлер \(spoler)"
    }
}

class TrunkCar: CarProtocol {
    var brand: String
    var year: Int
    var color: String
    var light: Light
    var tent: Tent
    
    init(brand: String,
         year: Int,
         color: String,
         light:Light,
         tent: Tent) {
        self.brand = brand
        self.year = year
        self.color = color
        self.light = light
        self.tent = tent
    }
   
    func actionTent (tent: Tent){         //функция открытия и закрытия тента грузовика
        switch tent {
        case .Open:
            if self.tent == .Open {
            print("Тент уже поднят/открыт")
            }
            else {
            print("Тент поднят/открыт")
                self.tent = .Open
            }
        case .Close:
            if self.tent == .Close {
            print("Тент уже опущен/закрыт")
            }
            else {
            print("Тент опущен/закрыт")
                self.tent = .Close
            }
        
        
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(brand) | \(year) | \(color) | фары \(light) | тент \(tent)"
    }
}

var auto1 = SportCar (brand: "Toyota", year: 2000, color: "Белый", light: .On, spoler: .Open)
auto1.spoler = .Close
var auto2 = TrunkCar (brand: "Зил", year: 1993, color: "Синий", light: .Off, tent: .Close)
auto2.light = .Off

print(auto1)
print(auto2)

auto2.actionTent(tent: .Open)
print(auto2)

auto2.actionTent(tent: .Open)
print(auto2)

auto2.tent = .Close
auto2.actionTent(tent: .Close)
print(auto2)
