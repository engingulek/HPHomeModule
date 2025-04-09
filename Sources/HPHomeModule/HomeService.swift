//
//  File.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation

import Foundation
import HPNetworkKit

//MARK: HomeServiceProtocol
protocol HomeServiceProtocol {
    func getCharacters() async throws -> [CharacterElement]
}


//MARK: HomeService
class HomeService : HomeServiceProtocol {
    private let networkManager:NetworkManagerProtocol = NetworkManager()
    /// Fetch for Characters
    /// - Parameters:
    /// return  : CharacterElement
    func getCharacters() async throws -> [CharacterElement] {
     
        do{
            let response = try await networkManager.fetch(
                target: .characters,
                responseClass: [CharacterElement].self)
            return response
        }catch{
            throw error
            
        }
    }
}
