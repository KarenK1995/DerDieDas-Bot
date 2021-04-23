//
//  DerDieDas.swift
//  German
//
//  Created by Karen Karapetyan on 05.12.20.
//

import Foundation

struct ArticleAndNoun: Codable {
    let article: String
    let original: String
}

extension ArticleAndNoun {
    
    func getSpeakingText() -> String {
        return article + " " + original
    }
}

extension ArticleAndNoun: Identifiable {
    
    var id: String {
        return article + original
    }
}
