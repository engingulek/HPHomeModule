//
//  SwiftUIView.swift
//
//
//  Created by Engin Gülek on 9.04.2025.
//

import SwiftUI
import HPNavigationKit
import HPCoreKit

struct HomeView<ViewModel:HomeViewModelProtocol>: View {
    
    @StateObject var viewModel:ViewModel
    @EnvironmentObject var navigation:Navigation
    var body: some View {
        VStack {
            if(viewModel.errorState.state) {
                Text(viewModel.errorState.message)
            }else{
                List(viewModel.characterList,id: \.index) { character in
                    CharacterElementView(characterElement: character)
                        .onTapGesture {
                            navigation.push(.detail(character.index))
                        }
                }
            }
        }
        .navigationTitle(NavTitle.homePage.rawValue)
        .task {
            await viewModel.task()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()))
}
