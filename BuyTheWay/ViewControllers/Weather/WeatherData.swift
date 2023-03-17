//
//  WeatherData.swift
//  BuyTheWay
//
//  Created by Mac on 3/16/23.
//

import Foundation

struct WeatherData:Codable {
    
    let location:LocationData
    let current:CurrenData
}
