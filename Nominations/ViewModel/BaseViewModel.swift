//
//  BaseViewModel.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import Combine

enum ViewState: Equatable {
    case loading
    case failed(error: Error)
    case success
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case (.success, .success):
                return true
            case (.failed(error: let lhsType), .failed(error: let rhsType)):
                return lhsType.localizedDescription == rhsType.localizedDescription
            default:
                return false
        }
    }
}

class BaseViewModel: NSObject, ObservableObject {
    @Published var state: ViewState = .loading
    @Published var message: String = ""
    
    func processError(_ res: Subscribers.Completion<NetworkError>) {
        switch res {
            case .failure(let error):
                self.state = .failed(error: error)
                self.message = error.localizedDescription
                print(message)
            case .finished:
                self.state = .success
        }
    }
}
