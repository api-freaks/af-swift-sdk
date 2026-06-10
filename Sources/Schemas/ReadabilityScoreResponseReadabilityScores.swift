import Foundation

/// Standard readability formula scores, keyed by metric name. Metrics that cannot be computed for the supplied text are omitted.
public struct ReadabilityScoreResponseReadabilityScores: Codable, Hashable, Sendable {
    /// Flesch Reading Ease
    public let fleschReadingEase: ReadabilityScoreResponseReadabilityScoresFleschReadingEase?
    /// Flesch-Kincaid Grade Level
    public let fleschKincaidGrade: ReadabilityScoreResponseReadabilityScoresFleschKincaidGrade?
    /// Gunning Fog Index
    public let gunningFog: ReadabilityScoreResponseReadabilityScoresGunningFog?
    /// SMOG Index
    public let smogIndex: ReadabilityScoreResponseReadabilityScoresSmogIndex?
    /// Coleman-Liau Index
    public let colemanLiauIndex: ReadabilityScoreResponseReadabilityScoresColemanLiauIndex?
    /// Automated Readability Index (ARI)
    public let automatedReadabilityIndex: ReadabilityScoreResponseReadabilityScoresAutomatedReadabilityIndex?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fleschReadingEase: ReadabilityScoreResponseReadabilityScoresFleschReadingEase? = nil,
        fleschKincaidGrade: ReadabilityScoreResponseReadabilityScoresFleschKincaidGrade? = nil,
        gunningFog: ReadabilityScoreResponseReadabilityScoresGunningFog? = nil,
        smogIndex: ReadabilityScoreResponseReadabilityScoresSmogIndex? = nil,
        colemanLiauIndex: ReadabilityScoreResponseReadabilityScoresColemanLiauIndex? = nil,
        automatedReadabilityIndex: ReadabilityScoreResponseReadabilityScoresAutomatedReadabilityIndex? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fleschReadingEase = fleschReadingEase
        self.fleschKincaidGrade = fleschKincaidGrade
        self.gunningFog = gunningFog
        self.smogIndex = smogIndex
        self.colemanLiauIndex = colemanLiauIndex
        self.automatedReadabilityIndex = automatedReadabilityIndex
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fleschReadingEase = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScoresFleschReadingEase.self, forKey: .fleschReadingEase)
        self.fleschKincaidGrade = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScoresFleschKincaidGrade.self, forKey: .fleschKincaidGrade)
        self.gunningFog = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScoresGunningFog.self, forKey: .gunningFog)
        self.smogIndex = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScoresSmogIndex.self, forKey: .smogIndex)
        self.colemanLiauIndex = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScoresColemanLiauIndex.self, forKey: .colemanLiauIndex)
        self.automatedReadabilityIndex = try container.decodeIfPresent(ReadabilityScoreResponseReadabilityScoresAutomatedReadabilityIndex.self, forKey: .automatedReadabilityIndex)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fleschReadingEase, forKey: .fleschReadingEase)
        try container.encodeIfPresent(self.fleschKincaidGrade, forKey: .fleschKincaidGrade)
        try container.encodeIfPresent(self.gunningFog, forKey: .gunningFog)
        try container.encodeIfPresent(self.smogIndex, forKey: .smogIndex)
        try container.encodeIfPresent(self.colemanLiauIndex, forKey: .colemanLiauIndex)
        try container.encodeIfPresent(self.automatedReadabilityIndex, forKey: .automatedReadabilityIndex)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fleschReadingEase = "flesch_reading_ease"
        case fleschKincaidGrade = "flesch_kincaid_grade"
        case gunningFog = "gunning_fog"
        case smogIndex = "smog_index"
        case colemanLiauIndex = "coleman_liau_index"
        case automatedReadabilityIndex = "automated_readability_index"
    }
}