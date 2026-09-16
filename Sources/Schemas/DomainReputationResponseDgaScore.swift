import Foundation

/// Domain Generation Algorithm (DGA) detection results.
public struct DomainReputationResponseDgaScore: Codable, Hashable, Sendable {
    /// DGA likelihood score (0-1).
    public let score: Float
    /// Indicates whether the domain is likely DGA-generated.
    public let isDga: Bool
    /// Model used to compute the DGA score.
    public let model: String
    /// Underlying lexical / statistical features used in DGA detection.
    public let features: DomainReputationResponseDgaScoreFeatures
    /// Human-readable interpretation of the DGA score.
    public let interpretation: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        score: Float,
        isDga: Bool,
        model: String,
        features: DomainReputationResponseDgaScoreFeatures,
        interpretation: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.score = score
        self.isDga = isDga
        self.model = model
        self.features = features
        self.interpretation = interpretation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.score = try container.decode(Float.self, forKey: .score)
        self.isDga = try container.decode(Bool.self, forKey: .isDga)
        self.model = try container.decode(String.self, forKey: .model)
        self.features = try container.decode(DomainReputationResponseDgaScoreFeatures.self, forKey: .features)
        self.interpretation = try container.decode(String.self, forKey: .interpretation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.score, forKey: .score)
        try container.encode(self.isDga, forKey: .isDga)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.features, forKey: .features)
        try container.encode(self.interpretation, forKey: .interpretation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case score
        case isDga = "is_dga"
        case model
        case features
        case interpretation
    }
}