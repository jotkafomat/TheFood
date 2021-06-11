//
//  String + HTML.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 11/06/2021.
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        htmlToAttributedString?.string ?? ""
    }
}
