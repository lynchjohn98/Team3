//
//  UserData.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/29/21.
//
import Foundation
import CloudKit


struct SquirrelUser : Hashable, Codable, CloudKitProtocol {
    var id = UUID()
    var username = String()
    var greySquirrelSightings = Int()
    var redSquirrelSightings = Int()
    
    func save(complete: (() -> Void)? = nil) {
        saveToICloud(record: self) { (record, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            complete?()
        }
    }

    //Return users total sightings
    func getTotalSightings() -> Int {
        greySquirrelSightings + redSquirrelSightings
    }
    
    //Return users number of grey squirrel sightings
    func getGreySquirrelSightings() -> Int {
        greySquirrelSightings
    }
    //Return users number of red squirrel sightings
    func getRedSquirrelSightings() -> Int {
        redSquirrelSightings
    }
    
}

extension SquirrelUser {
    var cloudKit: CKRecord {
        get {
            let recordID = CKRecord.ID(recordName: self.id.uuidString)
            let record = CKRecord(recordType: "AllSquirrelUsers", recordID: recordID)
            record["username"] = self.username
            record["greySquirrelSightings"] = self.greySquirrelSightings
            record["redSquirrelSightings"] = self.redSquirrelSightings
            return record
        }
    }
    
    static func fromCloudKit(record: CKRecord) -> SquirrelUser {
        var user = SquirrelUser(id: UUID())
        user.id = UUID(uuidString: record.recordID.recordName)!
        user.username = record["username"] as! String
        user.greySquirrelSightings = record["greySquirrelSightings"] as! Int
        user.redSquirrelSightings = record["redSquirrelSightings"] as! Int
        return user
    }
}

