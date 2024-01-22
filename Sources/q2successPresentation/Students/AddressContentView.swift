//
//  AddressContentView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

public struct   AddressContentView: View {
    @Environment(\.modelContext) private var modelContext
    var student: Student

    public init(student: Student) {
        self.student = student
    }
    
    public var body: some View {
        NavigationSplitView {
            List {
                ForEach(student.addresses) { address in
                    NavigationLink {
                        AddressView(address: address)
                    } label: {
                        Text(address.name)
                    }
                }
                .onDelete(perform: deleteAddresses)
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
                    Button(action: addAddress) {
                        Label("Add Address", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an address")
        }
    }

    private func addAddress() {
        withAnimation {
            student.addresses.append(Address())
        }
    }

    private func deleteAddresses(offsets: IndexSet) {
        withAnimation {
            student.addresses.remove(atOffsets: offsets)
        }
    }
}

#Preview {
    AddressContentView(student: Student(name: "Jane", surname: "Doe"))
        .modelContainer(for: Student.self, inMemory: true)
}
