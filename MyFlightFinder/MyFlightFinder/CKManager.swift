//
//  CKManager.swift
//  MyFlightFinder
//
//  Created by Brock Boyington on 6/5/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CloudKit

class CKManager {
    
    static let shared = CKManager()
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    func fetch(type: String, predicate: NSPredicate, completion: @escaping([CKRecord]?, Error?) -> Void) {
        let query = CKQuery(recordType: type, predicate: predicate)
        publicDB.perform(query, inZoneWith: nil, completionHandler: completion)
    }
    
    
}
