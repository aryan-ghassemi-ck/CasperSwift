//
//  ContentView.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "building.columns")
                    Text("Home")
                }
            
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            Text("Blocks")
                .tabItem {
                    Image(systemName: "rectangle")
                    Text("Blocks")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
