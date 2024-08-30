//
//  DataModels.swift
//  Club_PhoneCopie
//
//  Created by yatziri on 26/08/24.
//

import Foundation
import SwiftUI



struct Contact: Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var color: Color
    var icon: String
    var favorite: Bool
    
    var isValid: Bool {
        !name.isEmpty && !phoneNumber.isEmpty
    }
    
    static var sampleData: [Contact] = [
        Contact(name: "Juan Pérez", phoneNumber: "123-456-7890", color: .green, icon: "🥦",favorite: true),
        Contact(name: "Ana García", phoneNumber: "987-654-3210", color: .pink, icon: "🍓",favorite: true),
        Contact(name: "Carlos Hernández", phoneNumber: "456-789-0123", color: .blue, icon: "🫐",favorite: false),
        Contact(name: "Marta Rodríguez", phoneNumber: "321-654-9870", color: .yellow, icon: "🍋",favorite: true),
        Contact(name: "Luis Martínez", phoneNumber: "654-321-0987", color: .orange, icon: "🍊",favorite: false),
        Contact(name: "Laura Gómez", phoneNumber: "789-012-3456", color: .purple, icon: "🍇",favorite: true),
        Contact(name: "Ricardo Díaz", phoneNumber: "234-567-8901", color: .red, icon: "🍒",favorite: true),
        Contact(name: "Sofía Torres", phoneNumber: "890-123-4567", color: .teal, icon: "🍏",favorite: true),
        Contact(name: "Alejandro Cruz", phoneNumber: "012-345-6789", color: .indigo, icon: "🍆",favorite: false),
        Contact(name: "Gabriela Ruiz", phoneNumber: "567-890-1234", color: .brown, icon: "🍫",favorite: false)
    ]
}
