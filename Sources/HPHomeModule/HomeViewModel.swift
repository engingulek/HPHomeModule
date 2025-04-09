//
//  File.swift
//  
//
//  Created by Engin Gülek on 9.04.2025.
//

import Foundation

//MARK: HomeViewModelProtocol
protocol HomeViewModelProtocol:ObservableObject{
    var characterList :[CharacterElement] {get}
    var errorState :(message:String,state:Bool) {get}
    
    func task() async
}

//MARK: HomeViewModel
class HomeViewModel : HomeViewModelProtocol {
    @Published private(set) var characterList : [CharacterElement] = []
    @Published private(set) var errorState :(message:String,state:Bool) = (message:"",state:false)
    
    private let service:HomeServiceProtocol
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    /// task
    func task() async  {
       await fetchCharacterList()
    }
}

//MARK: extension HomeViewModel
extension HomeViewModel {
    /// fetchCharacterList
    func fetchCharacterList() async {
        do{
            let list = try await service.getCharacters()
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                characterList = list
                errorState = ("",false)
            }
            
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                characterList = []
                errorState = ("Something went wrong",true)
            }
        }
    }
}
