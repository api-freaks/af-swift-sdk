import Foundation

public struct NotFoundErrorBodyUnresolvedValue: Codable, Hashable, Sendable {
    /// Detail message explaining why this symbol was not resolved.
    public let message: String?
    /// Optional list of supported symbols that closely match the unresolved symbol.
    public let suggestions: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: String? = nil,
        suggestions: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.suggestions = suggestions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.suggestions = try container.decodeIfPresent([String].self, forKey: .suggestions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.suggestions, forKey: .suggestions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case suggestions
    }
}