//
//  ContactViewModel.swift
//  Contacts
//
//  Created by Sean Coffin on 11/9/25.
//

import Observation
import Foundation

@Observable
class ContactViewModel {
    var contacts = [Contact]()
    
    init() {
        fetchContacts()
    }
    
    func fetchContacts() {
        contacts = [
            .init(id: "1",
                  firstName: "John",
                  lastName: "Staple",
                  email: "johnstaple@gmail.com"),
            
            .init(id: "2",
                  firstName: "Max",
                  lastName: "Apple",
                  email: "maxapple@gmail.com"),
            .init(id: "3",
                  firstName: "Ben",
                  lastName: "Webber",
                  email: "benwebber@gmail.com"),
            .init(id: "4",
                  firstName: "Sean",
                  lastName: "Coffin",
                  email: "seancoffin@gmail.com"),
                  
        ]
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts.remove(at: index)
    }
    
    func updateContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts[index] = contact
    }
    
    func searchResults(for query: String) -> [Contact] {
        guard !query.isEmpty else {
            return contacts
        }
        
        return contacts.filter {
            $0.firstName.localizedCaseInsensitiveContains(query) ||
            $0.lastName.localizedCaseInsensitiveContains(query) ||
            $0.email.localizedCaseInsensitiveContains(query)
        }
    }
}
