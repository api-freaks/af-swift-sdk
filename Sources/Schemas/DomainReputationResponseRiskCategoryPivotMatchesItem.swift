import Foundation

/// A related pivot linked to known threats.
public struct DomainReputationResponseRiskCategoryPivotMatchesItem: Codable, Hashable, Sendable {
    /// Pivot value (e.g. a nameserver or email address).
    public let pivot: String
    /// Type of pivot.
    public let pivotType: String
    /// Total number of threats related to this pivot.
    public let totalRelatedThreats: Int
    /// Confidence score for the pivot match (0-1).
    public let confidence: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pivot: String,
        pivotType: String,
        totalRelatedThreats: Int,
        confidence: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pivot = pivot
        self.pivotType = pivotType
        self.totalRelatedThreats = totalRelatedThreats
        self.confidence = confidence
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pivot = try container.decode(String.self, forKey: .pivot)
        self.pivotType = try container.decode(String.self, forKey: .pivotType)
        self.totalRelatedThreats = try container.decode(Int.self, forKey: .totalRelatedThreats)
        self.confidence = try container.decode(Float.self, forKey: .confidence)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pivot, forKey: .pivot)
        try container.encode(self.pivotType, forKey: .pivotType)
        try container.encode(self.totalRelatedThreats, forKey: .totalRelatedThreats)
        try container.encode(self.confidence, forKey: .confidence)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pivot
        case pivotType = "pivot_type"
        case totalRelatedThreats = "total_related_threats"
        case confidence
    }
}