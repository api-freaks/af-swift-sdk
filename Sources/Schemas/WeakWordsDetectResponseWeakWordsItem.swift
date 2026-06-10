import Foundation

public struct WeakWordsDetectResponseWeakWordsItem: Codable, Hashable, Sendable {
    /// The detected weak word
    public let word: String
    /// Zero-based word position in the input text
    public let offset: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        word: String,
        offset: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.word = word
        self.offset = offset
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.offset = try container.decode(Int.self, forKey: .offset)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.word, forKey: .word)
        try container.encode(self.offset, forKey: .offset)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case word
        case offset
    }
}