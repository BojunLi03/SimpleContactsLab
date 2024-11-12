//
//  Person.swift
//  SimpleContacts
//
//  Created by Bojun Li on 11/11/24.
//

import Foundation
import SwiftData

@Model
class Person {
    var email: String
    var name: String
    var details: String
    @Attribute(.externalStorage) var photo: Data?
    init(name: String, email: String, details: String) {
        self.email = email
        self.name = name
        self.details = details
    }
}
