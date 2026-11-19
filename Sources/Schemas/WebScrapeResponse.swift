import Foundation

/// The API returns an empty object `{}` when no extract instruction matched anything.
public struct WebScrapeResponse: Codable, Hashable, Sendable {
    /// Extracted data based on the extract instructions. Absent when nothing was extracted.
    public let extractedData: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        extractedData: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.extractedData = extractedData
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.extractedData = try container.decodeIfPresent([String: JSONValue].self, forKey: .extractedData)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.extractedData, forKey: .extractedData)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case extractedData
    }
}