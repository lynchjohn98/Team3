//
//  CreateUserData.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/29/21.
//

import Foundation
import CloudKit

    
    func createData() {
        let userTest = User(username: "lynchjohn98", greySquirrelSightings: 0, redSquirrelSightings: 0)
        userTest.save() {
            print("Was saved")
        }
        
    }

