//
//  ContactDetailView.swift
//  Club_PhoneCopie
//
//  Created by yatziri on 26/08/24.
//
import SwiftUI

struct ContactDetailView: View {
    @Binding var contact: Contact
    @Binding var contacts: [Contact]
    @State private var showEditContactView = false
    
    var body: some View {
        VStack {
            ZStack {
                contact.color
                    .ignoresSafeArea()
                    .frame(height: 180.0)
                    .opacity(0.3)
                Circle()
                    .fill(contact.color)
                    .opacity(0.3)
                    .frame(width: 150, height: 150)
                
                Text(contact.icon)
                    .font(.system(size: 100))
                    .ignoresSafeArea()
            }
            List {
                Section {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(contact.color)
                                .opacity(0.3)
                                .frame(width: 50, height: 50)
                            
                            Text(contact.icon)
                                .font(.largeTitle)
                        }
                        Text(contact.name)
                            .font(.title3)
                    }
                }
                Section {
                    VStack(alignment: .leading) {
                        Text("Número")
                            .font(.body)
                        Text(contact.phoneNumber)
                            .foregroundColor(.blue)
                    }
                }
                Button(action: {
                    contact.favorite.toggle()
                }) {
                    HStack{
                        if contact.favorite{
                            Text("Remove from favourite")
                            Spacer()
                            Image(systemName: "heart.fill")
                                .font(.title3)
                            
                        }else{
                            
                            Text("Add to favourite")
                            Spacer()
                            Image(systemName: "heart")
                                .font(.title3)
                        }
                    }
                }
            }
            .navigationTitle(contact.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Editar") {
                        showEditContactView.toggle()
                    }
                }
            }
            .sheet(isPresented: $showEditContactView) {
                if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
                    AddContactView(contact: $contacts[index])
                }
            }
        }
    }
}

#Preview {
    ContactDetailView(contact: .constant(Contact(name: "Ana García", phoneNumber: "987-654-3210", color: .pink, icon: "🍓", favorite: true)), contacts: .constant([Contact(name: "Ana García", phoneNumber: "987-654-3210", color: .pink, icon: "🍓",favorite: false)]))
}
