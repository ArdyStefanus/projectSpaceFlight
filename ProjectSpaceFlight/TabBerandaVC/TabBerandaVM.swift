//
//  TabBerandaVM.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 11/05/25.
//
import UIKit

class TabBerandaVM {
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12:
            return "Good morning, User"
        case 12..<17:
            return "Good afternoon, User"
        case 17..<21:
            return "Good evening, User"
        default:
            return "Good night, User"
        }
    }
}
