//
//  DerDieDasDataProvider.swift
//  German
//
//  Created by Karen Karapetyan on 05.12.20.
//

import Foundation
import Vapor

class DerDieDasDataProvider {
    
    class func search(searchTerm: String) -> ArticleAndNoun? {
        let searchingText = searchTerm.lowercased()
        if searchTerm == "" {
            return nil
        }
        else {
            return nouns.first { noun -> Bool in
                noun.original.lowercased() == searchingText
            }
        }
    }
    
    static var nouns: [ArticleAndNoun] = {
        
        let directory = DirectoryConfiguration.detect()
        print("directory = \(directory)")
        let configDir = "Sources/App/Configuration/"
        
        let url = URL(fileURLWithPath: directory.workingDirectory)
                .appendingPathComponent(configDir, isDirectory: true)
                .appendingPathComponent("wordList.json", isDirectory: false)
        do {
            let data = try Data(contentsOf: url)
            guard let nouns = try? JSONDecoder().decode([ArticleAndNoun].self, from: data) else {
                fatalError("Cannot decode cities from file wordList.json file")
            }
            return nouns
        }
        catch {
            print(error)
        }
        return []
    }()
}
