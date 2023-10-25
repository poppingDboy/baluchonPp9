//
//  TabBarView.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 12/09/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Group {
                TraductionView()
                    .tabItem {
                        Label("Traducteur", systemImage: "text.append")
                    }
                
                WeatherView()
                    .tabItem {
                        Label("Météo", systemImage: "cloud.sun")
                    }
                
                CurrencyView()
                    .tabItem {
                        Label("Taux de change", systemImage: "dollarsign.arrow.circlepath")
                    }
            }
            .toolbarBackground(CustomColor.greenMenthol, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
        }    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
