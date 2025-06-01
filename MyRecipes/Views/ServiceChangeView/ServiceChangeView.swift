//
//  ServiceChangeView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 01/06/25.
//

import SwiftUI

struct ServiceChangeView: View {
    @Binding var service: ServiceProtocol
    @Binding var serviceType: ServiceType
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Drinks Recipe Service")
                    Spacer()
                    Image(systemName: serviceType != .meal ? "checkmark" : "")
                        .foregroundStyle(.cyan)
                }
                .onTapGesture {
                    serviceType = .drink
                    service = CocktailService()
                }
                HStack() {
                    Text("Meals Recipe Service")
                    Spacer()
                    Image(systemName: serviceType == .meal ? "checkmark" : "")
                        .foregroundStyle(.cyan)
                }
                .onTapGesture {
                    serviceType = .meal
                    service = MealService()
                }
            }
            .navigationTitle("Service Change")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    ServiceChangeView(service: MealService(), serviceType: .constant(.drink))
//}
