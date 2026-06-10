import Foundation

public struct GrammarDetectResponse: Codable, Hashable, Sendable {
    /// List of words flagged as grammatically incorrect
    public let grammarErrors: [GrammarDetectResponseGrammarErrorsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        grammarErrors: [GrammarDetectResponseGrammarErrorsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.grammarErrors = grammarErrors
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.grammarErrors = try container.decode([GrammarDetectResponseGrammarErrorsItem].self, forKey: .grammarErrors)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.grammarErrors, forKey: .grammarErrors)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case grammarErrors = "grammar_errors"
    }
}