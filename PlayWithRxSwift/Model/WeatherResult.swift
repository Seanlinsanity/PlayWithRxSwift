//
//  WeatherResult.swift
//  PlayWithRxSwift
//
//  Created by Sean on 2020/10/24.
//

import Foundation

struct WeatherResult: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
