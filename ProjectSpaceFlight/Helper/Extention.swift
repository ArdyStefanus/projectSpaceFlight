//
//  Extention.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 11/05/25.
//

import UIKit

extension String {
    func formattedDate() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        if let date = isoFormatter.date(from: self) {
            return date.toLocalString()
        }

        isoFormatter.formatOptions = [.withInternetDateTime]
        if let date = isoFormatter.date(from: self) {
            return date.toLocalString()
        }

        return "-"
    }
    
    func firstSentence() -> String {
        if let endIndex = self.firstIndex(of: ".") {
            let sentence = self[..<endIndex]
            return sentence.trimmingCharacters(in: .whitespacesAndNewlines) + "."
        }
        return self
    }
}

extension Date {
    func toLocalString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy, HH:mm"
        formatter.locale = Locale(identifier: "id_ID")
        formatter.timeZone = .current
        return formatter.string(from: self)
    }
}
