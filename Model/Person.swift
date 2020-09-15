//
//  Person.swift
//  CommandApp
//
//  Created by Rasikon on 14.09.2020.
//  Copyright © 2020 Rasikon. All rights reserved.
//

import Foundation

struct Person {
    
    let login: String
    let name: String
    let surname: String
    let password: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}


