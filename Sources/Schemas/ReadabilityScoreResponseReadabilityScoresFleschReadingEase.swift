import Foundation

/// Flesch Reading Ease
public struct ReadabilityScoreResponseReadabilityScoresFleschReadingEase: Codable, Hashable, Sendable {
    /// The metric score
    public let score: Double?
    /// Human-readable difficulty level for that metric
    public let level: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        score: Double? = nil,
        level: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.score = score
        self.level = level
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.score = try container.decodeIfPresent(Double.self, forKey: .score)
        self.level = try container.decodeIfPresent(String.self, forKey: .level)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.score, forKey: .score)
        try container.encodeIfPresent(self.level, forKey: .level)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case score
        case level
    }
}