//
//  CurrentData.swift
//  BuyTheWay
//
//  Created by Mac on 3/16/23.
//

import Foundation

struct CurrenData:Codable {
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
}
