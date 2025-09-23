//
//  ContentView.swift
//  CupCake
//
//  Created by Aman Abraham on 9/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select you cakes", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any Special Requests?", isOn: $order.specialRequestEnables.animation())
                    if order.specialRequestEnables {
                        Toggle("Any extra frosting", isOn: $order.extraFrosting)
                        Toggle("Any extra sprinkles", isOn: $order.addSprinkles)
                    }

                }
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
