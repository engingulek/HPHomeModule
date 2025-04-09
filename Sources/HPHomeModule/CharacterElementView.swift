//
//  SwiftUIView.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import SwiftUI
import HPCoreKit

struct CharacterElementView: View {
    let characterElement:CharacterElement
    var body: some View {
        HStack {
            CreateImage.from(url: URL(string: characterElement.image),
                             frame: 100)
            
            VStack(alignment: .leading) {
                PrimaryText(characterElement.interpretedBy,
                            .black,
                            boldState: true)
                
                SecondaryText("\(ThemeSubTitle.fullName.rawValue)\(characterElement.fullName)",
                              .black,boldState: false)
                
                SecondaryText("\(ThemeSubTitle.nickName.rawValue)\(characterElement.nickname)",
                              .black,boldState: false)
                
                SecondaryText("\(ThemeSubTitle.hogwartsHouse.rawValue)\(characterElement.hogwartsHouse.rawValue)",
                              .black,boldState: false)
            }
            
        }
    }
}
