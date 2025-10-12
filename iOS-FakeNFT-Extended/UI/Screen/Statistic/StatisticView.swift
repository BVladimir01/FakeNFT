//
//  StatisticView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Алина on 11.10.2025.
//
import SwiftUI

struct StatisticView: View {
    var body: some View {
        NavigationStack {
            StatisticList()
                .toolbar {
                    NavigationMenuButton(icon: .sort) {
                        print("Button tapped")
                    }
                }
        }
    }
}

#Preview("StatisticView") {
    TabView {
        Text("Каталог")
            .tabItem { Label(Tab.catalog.title, image: Tab.catalog.image) }

        Text("Корзина")
            .tabItem { Label(Tab.cart.title, image: Tab.cart.image) }

        Text("Профиль")
            .tabItem { Label(Tab.profile.title, image: Tab.profile.image) }

        StatisticView()
            .tabItem { Label(Tab.statistic.title, image: Tab.statistic.image) }
    }
    .accentColor(.ypUBlue)
}
