import Foundation

public struct ReadabilityScoreResponse: Codable, Hashable, Sendable {
    /// Standard readability formula scores, keyed by metric name. Metrics that cannot be computed for the supplied text are omitted.
    public let readabilityScores: ReadabilityScoreResponseReadabilityScores?
    /// Per-sentence readability breakdown
    public let sentenceReadability: [ReadabilityScoreResponseSentenceReadabilityItem]?
    /// Overall readability grade, calculated as the average of sentence readability scores
    public let readabilityGrade: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        readabilityScores: ReadabilityScoreResponseReadabilityScores? = nil,
        sentenceReadability: [ReadabilityScoreResponseSentenceReadabilityItem]? = nil,
        readabilityGrade: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.readabilityScores = readabilityScores
        self.sentenceReadability = sentenceReadability
        self.readabilityGrade = readabilityGrade
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.readabilityScores = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScores.self, forKey: .readabilityScores)
        self.sentenceReadability = try container.decodeIfPresent([ReadabilityScoreResponseSentenceReadabilityItem].self, forKey: .sentenceReadability)
        self.readabilityGrade = try container.decodeIfPresent(Double.self, forKey: .readabilityGrade)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.readabilityScores, forKey: .readabilityScores)
        try container.encodeIfPresent(self.sentenceReadability, forKey: .sentenceReadability)
        try container.encodeIfPresent(self.readabilityGrade, forKey: .readabilityGrade)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case readabilityScores = "readability_scores"
        case sentenceReadability = "sentence_readability"
        case readabilityGrade = "readability_grade"
    }
}