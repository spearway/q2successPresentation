//
//  EmailView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

struct EmailView: View {
    @Environment(\.modelContext) private var modelContext
    var email: Email
    
    public init(email: Email) {
        self.email = email
    }
    
    var body: some View {
        Text(email.name)
    }
}

#Preview {
    EmailView(email: Email())
        .modelContainer(for: Email.self, inMemory: true)
}
