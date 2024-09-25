//
//  Trade.swift
//  DisplayDataFromAPI
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import Foundation
struct Trade : Codable {
        let status: String
        let totalResults: Int
        let articles: [Article]
    }

    struct Article: Codable {
        let source: Source
        let author: String?
        let title: String
        let articleDescription: String
        let url: String
        let urlToImage: String?
        let publishedAt: String
        let content: String?
        
        enum CodingKeys: String, CodingKey {
            case source, author, title
            case articleDescription = "description"
            case url, urlToImage, publishedAt, content
        }
    }

    struct Source: Codable {
        let id: String?
        let name: String
    }
