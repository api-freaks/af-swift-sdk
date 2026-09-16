import Foundation

/// Summary of reasons behind the risk assessment.
public struct DomainReputationResponseEvidenceSummary: Codable, Hashable, Sendable {
    /// List of reasons why the domain was flagged. Empty for a clean domain.
    public let whyFlagged: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        whyFlagged: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.whyFlagged = whyFlagged
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.whyFlagged = try container.decode([String].self, forKey: .whyFlagged)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.whyFlagged, forKey: .whyFlagged)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case whyFlagged = "why_flagged"
    }
}