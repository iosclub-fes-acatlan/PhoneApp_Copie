//
//  ContactsView.swift
//  Club_PhoneCopie
//
//  Created by yatziri on 26/08/24.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var contacts: [Contact] = Contact.sampleData
    @State private var showAddContactView = false
    @State private var newContact = Contact(name: "", phoneNumber: "", color: .gray, icon: "?", favorite: false)
    
    var body: some View {
        NavigationView {
            List {
                ForEach($contacts) { $contact in
                    NavigationLink(destination: ContactDetailView(contact: $contact, contacts: $contacts)) {
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(contact.color)
                                    .opacity(0.3)
                                    .frame(width: 50, height: 50)
                                
                                Text(contact.icon)
                                    .font(.largeTitle)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(contact.name)
                                    .font(.headline)
                                Text(contact.phoneNumber)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteContact)
            }
            .listStyle(.inset)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        newContact = Contact(name: "", phoneNumber: "", color: .gray, icon: "?",favorite: false)
                        showAddContactView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddContactView) {
                AddContactView(contact: $newContact, contacts: $contacts)
                    .onDisappear {
                        if !newContact.name.isEmpty && !newContact.phoneNumber.isEmpty {
                            contacts.append(newContact)
                        }
                    }
            }
        }
    }
    
    private func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

#Preview {
    ContactsView()
}
