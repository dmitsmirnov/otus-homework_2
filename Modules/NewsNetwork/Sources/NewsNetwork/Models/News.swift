//
// News.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct News: Codable, JSONEncodable, Hashable {

    //public var source: Source?
    public var author: String?
    public var title: String?
    public var description: String?
    public var url: String
    public var image: String?
    public var published: String?
    public var language: String?

    public init(author: String? = nil, title: String? = nil, description: String? = nil, url: String, image: String? = nil, published: String? = nil, language: String? = nil) {
        //self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.image = image
        self.published = published
        self.language = language
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        //case source
        case author
        case title
        case description
        case url
        case image
        case published
        case language
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(author, forKey: .author)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(url, forKey: .url)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(published, forKey: .published)
        try container.encodeIfPresent(language, forKey: .language)
    }
}
