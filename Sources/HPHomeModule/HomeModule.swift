//
//  File.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation
import SwiftUI
import HPModularProtocolsKit

//MARK:  HomeModule : HomeModuleProrocol 
public class HomeModule : HomeModuleProrocol {
    public init() { }
    
    public func createHomeModuleView() -> AnyView {
        let view = HomeView(viewModel: HomeViewModel(service: HomeService()))
        return AnyView(view)
    }
    
    
    
}

