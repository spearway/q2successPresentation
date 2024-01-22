//
//  AddressView.swift
//
//
//  Created by pierre on 2024-01-22.
//

import SwiftUI
import SwiftData
import q2successStudent

struct AddressView: View {
    @Environment(\.modelContext) private var modelContext
    var address: Address
    
    public init(address: Address) {
        self.address = address
    }

    
    var body: some View {
        Text(address.name)
        TextField("Name", text: Bindable(address).name)
            .disableAutocorrection(true)
        TextField("Line 1", text: Bindable(address).line1)
            .disableAutocorrection(true)
        TextField("Line 2", text: Bindable(address).line2)
            .disableAutocorrection(true)
        TextField("Line 3", text: Bindable(address).line3)
            .disableAutocorrection(true)
        TextField("City", text: Bindable(address).city)
            .disableAutocorrection(true)
        TextField("Post/Zip Code", text: Bindable(address).postalCode)
            .disableAutocorrection(true)
        TextField("County", text: Bindable(address).county)
            .disableAutocorrection(true)
        TextField("Province/State", text: Bindable(address).province)
            .disableAutocorrection(true)
        TextField("Country", text: Bindable(address).country)
            .disableAutocorrection(true)
    }
}

#Preview {
    AddressView(address: Address())
        .modelContainer(for: Address.self, inMemory: true)
}
