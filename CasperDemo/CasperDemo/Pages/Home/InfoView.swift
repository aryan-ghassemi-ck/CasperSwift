//
//  InfoView.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import SwiftUI

struct InfoView: View {
    
    let viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.header)
            
            Text(viewModel.content)
            
            Text(viewModel.footer)
        }
    }
                
    struct ViewModel {
        let header: String
        let content: String
        let footer: String
    }
}

