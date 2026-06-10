import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemExtract: Codable, Hashable, Sendable {
    /// Defines what data to extract and how to extract it.
    public let extract: WebScrapeRequestBodyBlockUrlInstructionsItemExtractExtract?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        extract: WebScrapeRequestBodyBlockUrlInstructionsItemExtractExtract? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.extract = extract
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.extract = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemExtractExtract.self, forKey: .extract)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.extract, forKey: .extract)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case extract
    }
}