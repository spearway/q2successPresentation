//
//  RegistrationView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

struct RegistrationView: View {
    @Environment(\.modelContext) private var modelContext
    var registration: Registration
    
    public init(registration: Registration) {
        self.registration = registration
    }
    
    var body: some View {
        Text(registration.courseId.uuidString)
    }
}

#Preview {
    RegistrationView(registration: Registration(courseId: UUID()))
        .modelContainer(for: Registration.self, inMemory: true)
}
