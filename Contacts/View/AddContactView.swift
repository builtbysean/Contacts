//
//  AddContactView.swift
//  Contacts
//
//  Created by Sean Coffin on 11/9/25.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactViewModel.self) var viewModel
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First Name", text: $firstName)
                
                TextField("Last Name", text: $lastName)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        addContact()
                        dismiss()
                    }
                    .font(.headline)
                }
            }
        }
    }
}

private extension AddContactView {
    func addContact() {
        let contact = Contact(
            id: UUID().uuidString,
            firstName: firstName,
            lastName: lastName,
            email: email
        )
        
        viewModel.addContact(contact)
    }
}
#Preview {
    AddContactView()
        .environment(ContactViewModel())
}
