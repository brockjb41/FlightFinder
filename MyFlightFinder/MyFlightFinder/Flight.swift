//
//  Flight.swift
//  MyFlightFinder
//
//  Created by Brock Boyington on 6/5/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation

class Flight: Decodable {
    var startAirport: String
    var destinationAirport: String
    var price: Double
    var startDate: Date
    var leaveDate: Date
    
    init(startAirport: String, destinationAirport: String, price: Double, startDate: Date, leaveDate: Date) {
    self.startAirport = startAirport
    self.destinationAirport = destinationAirport
    self.price = price
    self.startDate = startDate
    self.leaveDate = leaveDate
    }
}
