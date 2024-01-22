//
//  StudentContentView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

public struct StudentContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var students: [Student]

    public init() {}
    
    public var body: some View {
        NavigationSplitView {
            List {
                ForEach(students) { student in
                    NavigationLink {
                        StudentView(student: student)
                    } label: {
                        Text(student.fullName())
                    }
                }
                .onDelete(perform: deleteStudents)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addStudent) {
                        Label("Add Student", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a student")
        }
    }

    private func addStudent() {
        withAnimation {
            modelContext.insert(Student(name: "", surname: ""))
        }
    }

    private func deleteStudents(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(students[index])
            }
        }
    }
}

#Preview {
    StudentContentView()
        .modelContainer(for: Student.self, inMemory: true)
}
