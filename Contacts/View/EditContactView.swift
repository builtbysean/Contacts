//
//  EditContactView.swift
//  Contacts
//
//  Created by Sean Coffin on 11/9/25.
//

import SwiftUI

struct EditContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactViewModel.self) var viewModel
    
    @State private var contact: Contact
    @State private var contactDidChange = false
    @State private var showExitConfirmation = false
    @State private var showDeleteConfirmation = false

    
    private let originalContact: Contact
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
        self.originalContact = contact
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("First Name", text: $contact.firstName)
                
                TextField("Last Name", text: $contact.lastName)
                
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Button("Delete") {
                showDeleteConfirmation.toggle()
            }
            .foregroundStyle(.red)
        }
        .onChange(of: contact, { oldValue, newValue in
            contactDidChange = newValue != originalContact
        })
        .alert("Unsaved Changes", isPresented: $showExitConfirmation) {
            Button("Stay", role: .cancel) { }
            
            Button("Discard Changes", role: .destructive) {
                dismiss()
            }
        }
        .alert("Delete Contact?", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                deleteContact()
            }
        }
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    onCancel()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    updateContact()
                }
                .disabled(!contactDidChange)
                .opacity(contactDidChange ? 1.0 : 0.5)
                .font(.headline)
            }
        }
    }
}

private extension EditContactView {
    func onCancel() {
        if contactDidChange {
            showExitConfirmation = true
        } else {
            dismiss()
        }
    }
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func updateContact() {
        viewModel.updateContact(contact)
        dismiss()
    }
}
#Preview {
    EditContactView(contact: .init(id: "1", firstName: "Michael", lastName: "Jordan", email: "michaeljordan@gmail.com"
        )
    )
}
