import Foundation

/// Defines what data to extract and how to extract it.
public struct WebScrapeRequestBodyBlockUrlInstructionsItemExtractExtract: Codable, Hashable, Sendable {
    /// CSS selector or XPath to extract HTML content. Example: "/html/body"
    public let html: String?
    /// CSS selector or XPath to extract text content. Example: "/html/body/div/div[2]/text"
    public let text: String?
    /// CSS selector or XPath to extract user data. Example: "/html/body/div/div[2]"
    public let userData: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        html: String? = nil,
        text: String? = nil,
        userData: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.html = html
        self.text = text
        self.userData = userData
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.html = try container.decodeIfPresent(String.self, forKey: .html)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.userData = try container.decodeIfPresent(String.self, forKey: .userData)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.html, forKey: .html)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.userData, forKey: .userData)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case html
        case text
        case userData = "user_data"
    }
}