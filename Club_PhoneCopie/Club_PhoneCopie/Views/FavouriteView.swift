//
//  FavouriteView.swift
//  Club_PhoneCopie
//
//  Created by yatziri on 27/08/24.
//

import SwiftUI

struct FavouriteView: View {
    @State private var contacts: [Contact] = Contact.sampleData
    var body: some View {
        NavigationView {
            List {
                ForEach($contacts) { $contact in
                    if(contact.favorite){
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
                                Spacer()
                                Button(action: {
                                    contact.favorite = false
                                }) {
                                    Image(systemName: "heart.fill")
                                        .font(.title3)
                                        .foregroundStyle(.blue)
                                }
                               
                                
                            }
                        
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Favourite Contacts")
            
        
        }
    }
}

#Preview {
    FavouriteView()
}
