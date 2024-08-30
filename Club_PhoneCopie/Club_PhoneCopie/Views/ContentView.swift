//
//  ContentView.swift
//  Club_PhoneCopie
//
//  Created by yatziri on 26/08/24.
//
import SwiftUI


struct OtherView: View {
    var body: some View {
        Text("Otra Sección Relevante")
            .font(.largeTitle)
            .padding()
    }
}

struct ContentView: View {
    
    var body: some View {
        TabView {
            ContactsView()
                .tabItem {
                    Label("Contactos", systemImage: "person.3.fill")
                }
            
            FavouriteView()
                .tabItem {
                    Label("Favourite", systemImage: "heart")
                }
        }
    }
}

#Preview {
    ContentView()
}
