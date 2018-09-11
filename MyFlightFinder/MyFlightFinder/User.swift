//
//  User.swift
//  MyFlightFinder
//
//  Created by Brock Boyington on 6/5/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import Foundation
import CloudKit

class User {
    
    static let userTypeKey = "User"
    fileprivate static let usernameKey = "username"
    fileprivate static let firstNameKey = "firstName"
    fileprivate static let lastNameKey = "lastName"
    fileprivate static let homeAirportKey = "homeAirport"
    fileprivate static let appleUserRefKey = "appleUserRef"
    
    let firstName: String
    let lastName: String
    let username: String
    var homeAirport: String?
    
    var cloudKitRecordID: CKRecordID?
    let appleUserRef: CKReference
    
    init(firstName: String, lastName: String, username: String, homeAirport: String?, appleUserRef: CKReference) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.homeAirport = homeAirport
        self.appleUserRef = appleUserRef
    }
    
    init?(ckRecord: CKRecord) {
        guard let username = ckRecord[User.usernameKey] as? String,
        let firstName = ckRecord[User.firstNameKey] as? String,
        let lastName = ckRecord[User.lastNameKey] as? String,
        let homeAirport = ckRecord[User.homeAirportKey] as? String?,
        let appleUserRef = ckRecord[User.appleUserRefKey] as? CKReference
            else { return nil }
        
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.homeAirport = homeAirport
        self.appleUserRef = appleUserRef
        
        self.cloudKitRecordID = ckRecord.recordID
    }
}

extension CKRecord {
    convenience init(user: User) {
        let recordID = user.cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        self.init(recordType: User.userTypeKey, recordID: recordID)
        self.setValue(user.username, forKey: User.usernameKey)
        self.setValue(user.firstName, forKey: User.firstNameKey)
        self.setValue(user.lastName, forKey: User.lastNameKey)
        self.setValue(user.homeAirport, forKey: User.homeAirportKey)
        self.setValue(user.appleUserRef, forKey: User.appleUserRefKey)
        
        user.cloudKitRecordID = recordID
    }
}
