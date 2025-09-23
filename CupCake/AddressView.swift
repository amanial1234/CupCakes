//
//  AddressView.swift
//  CupCake
//
//  Created by Aman Abraham on 9/23/25.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("StreetAddres", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)

            }
            
            Section {
                NavigationLink ("Checkout"){
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
