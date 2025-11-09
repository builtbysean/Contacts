//
//  Contact.swift
//  Contacts
//
//  Created by Sean Coffin on 11/8/25.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    var initials: String
}
