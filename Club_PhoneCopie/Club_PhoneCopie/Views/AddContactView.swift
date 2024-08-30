//
//  AddContactView.swift
//  Club_PhoneCopie
//
//  Created by yatziri on 26/08/24.
//
import SwiftUI

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var contact: Contact
    var contacts: Binding<[Contact]>?
    
    init(contact: Binding<Contact>, contacts: Binding<[Contact]>? = nil) {
        self._contact = contact
        self.contacts = contacts
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    Color.gray                        
                        .ignoresSafeArea()
                        .frame(height: 180.0)
                        .opacity(0.1)
                    Circle()
                        .fill(contact.color)
                        .opacity(0.3)
                        .frame(width: 150, height: 150)
                    
                   
                    if(contact.icon == "?"){
                        Text(contact.icon)
                            .bold()
                            .opacity(0.3)
                            .font(.system(size: 100))
                            .ignoresSafeArea()
                    }else{
                        Text(contact.icon)
                            .bold()
                            .font(.system(size: 100))
                            .ignoresSafeArea()
                    }
                        
                }
                Form {
                    Section(header: Text("Editar Contacto")) {
                        TextField("Nombre", text: $contact.name)
                        TextField("Número de Teléfono", text: $contact.phoneNumber)
                        ColorPicker("Color del Contacto", selection: $contact.color)
                        TextField("Ícono", text: $contact.icon)
                    }
                }
            }
        
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(contact.name.isEmpty || contact.phoneNumber.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddContactView(contact: .constant(Contact(name: "Ana García", phoneNumber: "987-654-3210", color: .gray, icon: "?", favorite: true)))
}
