//
//  StudentView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

struct StudentView: View {
    @Environment(\.modelContext) private var modelContext
    var student: Student
    
    public init(student: Student) {
        self.student = student
    }
    
    var body: some View {
        TextField("Name", text: Bindable(student).name)
            .disableAutocorrection(true)
        TextField("Last Name", text: Bindable(student).surname)
            .disableAutocorrection(true)
        AddressContentView(student: student)
    }
}

#Preview {
    StudentView(student: Student(name: "Jane", surname: "Doe"))
        .modelContainer(for: Student.self, inMemory: true)
}
