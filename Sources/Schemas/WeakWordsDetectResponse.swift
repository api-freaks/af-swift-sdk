import Foundation

public struct WeakWordsDetectResponse: Codable, Hashable, Sendable {
    /// List of detected weak words
    public let weakWords: [WeakWordsDetectResponseWeakWordsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        weakWords: [WeakWordsDetectResponseWeakWordsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.weakWords = weakWords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weakWords = try container.decode([WeakWordsDetectResponseWeakWordsItem].self, forKey: .weakWords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.weakWords, forKey: .weakWords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case weakWords = "weak_words"
    }
}