import Foundation

public struct ReadabilityScoreResponseSentenceReadabilityItem: Codable, Hashable, Sendable {
    /// The sentence text
    public let sentence: String?
    /// Readability grade for the sentence
    public let readabilityGrade: Double?
    /// Difficulty level for the sentence based on the target audience
    public let readabilityLevel: ReadabilityScoreResponseSentenceReadabilityItemReadabilityLevel?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        sentence: String? = nil,
        readabilityGrade: Double? = nil,
        readabilityLevel: ReadabilityScoreResponseSentenceReadabilityItemReadabilityLevel? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.sentence = sentence
        self.readabilityGrade = readabilityGrade
        self.readabilityLevel = readabilityLevel
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sentence = try container.decodeIfPresent(String.self, forKey: .sentence)
        self.readabilityGrade = try container.decodeIfPresent(Double.self, forKey: .readabilityGrade)
        self.readabilityLevel = try container.decodeIfPresent(ReadabilityScoreResponseSentenceReadabilityItemReadabilityLevel.self, forKey: .readabilityLevel)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.sentence, forKey: .sentence)
        try container.encodeIfPresent(self.readabilityGrade, forKey: .readabilityGrade)
        try container.encodeIfPresent(self.readabilityLevel, forKey: .readabilityLevel)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case sentence
        case readabilityGrade = "readability_grade"
        case readabilityLevel = "readability_level"
    }
}