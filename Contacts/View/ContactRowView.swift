//
//  ContactRowView.swift
//  Contacts
//
//  Created by Sean Coffin on 11/8/25.
//

import SwiftUI

struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Text(contact.initials)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName)")
                
                Text(contact.email)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContactRowView(contact: .init(id: "1", firstName: "Michael", lastName: "Jordan", email: "michaeljordan@gmail.com"
        )
    )
}
