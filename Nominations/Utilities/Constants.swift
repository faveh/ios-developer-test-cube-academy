//
//  Constants.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation


class Constants {
    static var baseURL = "https://cube-academy-api.cubeapis.com/api"
}


struct FormConstants {
    static let warningSheetHeight: Double = 360
    static let createNominationTitle: String = "Create a nomination"
    static let nominateTitle: String = "I’d like to nominate..."
    static let nominateSubtitle: String = "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic."
    static let nameDropdownViewPadding: CGFloat = 46
    static let nominateThisCubeTitle: String = "I’d like to nominate THIS CUB BECAUSE..."
    static let nominateThisCubeSubtitle: String = "Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐"
    static let submitNominationButtonTitle: String = "submit nomination"
    static let backButtonTitle: String = "back"
    static let confirmTitle: String = "Are you sure?"
    static let confirmSubtitle: String = "If you leave this page, you will loose any progress made."
    static let leavePage = "yes, leave page"
    static let cancel = "cancel"
    
    static let editNominationTitle: String = "Editnomination"
    static let delete: String = "delete nomination"
    static let edit: String = "edit"
    
    static let primary: String = "Primary"
    static let next: String = "Next"
    
    static let options = [
        ("Very Unfair", R.image.veryUnfair.image, "very_unfair"),
        ("Unfair", R.image.unfair.image, "unfair"),
        ("Not sure", R.image.notSure.image, "not_sure"),
        ("Fair", R.image.fair.image, "fair"),
        ("Very Fair", R.image.veryFair.image, "very_fair"),
    ]
    static let cubeName: String = "Cube's name"
    static let nominees: String = "nominees"
    static let selectOption: String = "Select Option"
    static let reasoning: String = "Reasoning"
    static let maxCharacter = 28
    static let exceededLimit: String = "You have exceeded the maximum character limit of \(maxCharacter)."
    static let asterik: String = "*"
    
    static let radioHeaderText1 = "Is how we currently run ".uppercased()
    static let radioHeaderText2 = "cube of the month ".uppercased()
    static let radioHeaderText3 = "fair?".uppercased()
    static let radioSubtitle: String = "As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?"
    
    static let emptyTitle = "once you submit a nomination, you will be able to SEE it here.".uppercased()
    static let submitted: String = "Nomination submitted"
    static let createNewNomination: String = "create new nomination"
    static let thankYou: String = "Thank you for taking the time to fill out this form! Why not nominate another cube?"
    static let backToHome: String = "back to home"

}

struct HomeConstants {
    static let createButton: String = "create new nomination"
    static let yourNomination: String = "Your nominations"
}

struct ErrorConstants {
    static let decodingError: String = "Failed to decode the error from the API"
    static let errorCode: String = "Something went wrong"
    static let invalidCredentials: String = "Invalid Credentials"
    static let error: String = "Error"
    static let unknown: String = "The error is unknown"
    static let encodeError: String = "Failed to encode requestBody:"
    static let inValidURL: String = "Invalid URL"
}
