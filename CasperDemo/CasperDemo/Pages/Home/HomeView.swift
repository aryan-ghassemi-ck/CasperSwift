//
//  HomeView.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                if let info = viewModel.info {
                    VStack {
                        InfoView(viewModel: InfoView.ViewModel(
                            header: "BLOCK HEIGHT",
                            content: "\(info.lastAddedBlockInfo.height)",
                            footer: info.lastAddedBlockInfo.timestamp))
                    }
                }
            }
            .onAppear { viewModel.fetchData() }
            
            if viewModel.isLoading { LoadingView() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
