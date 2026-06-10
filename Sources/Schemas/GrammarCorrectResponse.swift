import Foundation

public struct GrammarCorrectResponse: Codable, Hashable, Sendable {
    /// The fully corrected text
    public let grammarCorrection: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        grammarCorrection: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.grammarCorrection = grammarCorrection
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.grammarCorrection = try container.decode(String.self, forKey: .grammarCorrection)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.grammarCorrection, forKey: .grammarCorrection)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case grammarCorrection = "grammar_correction"
    }
}