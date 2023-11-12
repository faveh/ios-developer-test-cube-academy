//
//  NominationViewModel.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import Combine

class NominationViewModel: BaseViewModel {
    private var service: NominationService
    private var cancellables = Set<AnyCancellable>()

    @Published var nominations = [Nomination]()
    @Published var nominees = [Nominee]()
    @Published var selectedRadioOption: String? = nil
    @Published var reasonText: String = ""
    @Published var reasonExceedingLimit: Bool = false
    @Published var selectedOption: String? = nil

    init(service: NominationService) {
        self.service = service
        super.init()
        getNominees()
        getNominations()
    }
    
    func isValidToSubmit() -> Bool {
        return selectedRadioOption != nil &&
               !reasonText.isEmpty &&
               !reasonExceedingLimit &&
               selectedOption != nil
    }
    
    func isFillingForm() -> Bool {
        return selectedRadioOption != nil ||
               !reasonText.isEmpty ||
                selectedOption != nil
    }
    
    func getNominations() {
        let cancellable = service.getNominations(from: .getAllNominations)
            .sink { [weak self] completion in
                self?.processError(completion)
            } receiveValue: { [weak self] nominations in
                self?.nominations = nominations.data ?? []
            }
        self.cancellables.insert(cancellable)
    }
    
    func getNominees() {
        let cancellable = service.getNominee(from: .getNominees)
            .sink { [weak self] completion in
                self?.processError(completion)
            } receiveValue: { [weak self] nomineesRes in
                self?.nominees = nomineesRes.data ?? []
            }
        self.cancellables.insert(cancellable)
    }
    
    func nominate(completion: @escaping (Bool) -> Void) {
        let requestBody = NominationRequest(nominee_id: selectedOption, reason: reasonText, process: selectedRadioOption)
        let cancellable = service.nominate(from: .createNomination(requestBody: requestBody))
            .sink { [weak self] completion in
                self?.processError(completion)
            } receiveValue: { [weak self] res in
                self?.getNominations()
                self?.selectedRadioOption = nil
                self?.reasonText = ""
                self?.selectedOption = nil
                // completion handler
                completion(true)
            }
        self.cancellables.insert(cancellable)
    }
}
