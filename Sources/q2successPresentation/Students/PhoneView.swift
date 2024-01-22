//
//  PhoneView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

struct PhoneView: View {
    @Environment(\.modelContext) private var modelContext
    var phone: Phone
    
    public init(phone: Phone) {
        self.phone = phone
    }
    
    var body: some View {
        Text(phone.name)
    }
}

#Preview {
    PhoneView(phone: Phone())
        .modelContainer(for: Phone.self, inMemory: true)
}
