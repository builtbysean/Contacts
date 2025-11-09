//
//  ContactsView.swift
//  Contacts
//
//  Created by Sean Coffin on 11/8/25.
//

import SwiftUI

struct ContactsView: View {
    @State private var contacts: [Contact] = [
        .init(id: "1",
              firstName: "John",
              lastName: "Staple",
              email: "johnstaple@gmail.com",
              initials: "JS"),
        
        .init(id: "2",
              firstName: "Max",
              lastName: "Apple",
              email: "maxapple@gmail.com",
              initials: "MA"),
        .init(id: "3",
              firstName: "Ben",
              lastName: "Webber",
              email: "benwebber@gmail.com",
              initials: "BW"),
        .init(id: "4",
              firstName: "Sean",
              lastName: "Coffin",
              email: "seancoffin@gmail.com",
              initials: "SC"),
              
    ]
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                ContactRowView(contact: contact)
            }
        }
    }
}

#Preview {
    ContactsView()
}
