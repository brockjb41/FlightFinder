//
//  FlightController.swift
//  MyFlightFinder
//
//  Created by Brock Boyington on 6/5/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation

class FlightController {
    static let shared = FlightController()
    
    var baseURL = URL(string: "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/USA/")
    
//    var flights = [Flight]()
    
    func fetchFlights(with searchTerm: String, completion: @escaping([Flight?]) -> Void) {
        guard let url = baseURL?.appendingPathComponent(searchTerm.lowercased()) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error fetching flight: \(error)")
            }
//            if let data = data {
//                do {
//                    let jsonDecoder = JSONDecoder()
//                    let flights = try jsonDecoder.decode([Flight].self, from: data)
//                    completion([Flight])
//                } catch let error {
//                    print("Error decoding flight data: \(error)")
//                    completion([Flight]); return
//                }
            }
        }
        dataTask.resume()
    }
}
