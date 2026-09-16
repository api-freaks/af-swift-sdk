import Foundation

/// A detected email deliverability issue or misconfiguration.
public struct DomainReputationResponseEmailDeliverabilityIssuesItem: Codable, Hashable, Sendable {
    /// Machine-readable code identifying the specific deliverability issue.
    public let code: String?
    /// Severity level assigned to the detected issue.
    public let severity: String?
    /// Human-readable explanation of the issue.
    public let message: String?
    /// Plain-language description of the exact fix to apply.
    public let recommendation: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String? = nil,
        severity: String? = nil,
        message: String? = nil,
        recommendation: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.severity = severity
        self.message = message
        self.recommendation = recommendation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.recommendation = try container.decodeIfPresent(String.self, forKey: .recommendation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.severity, forKey: .severity)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.recommendation, forKey: .recommendation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case severity
        case message
        case recommendation
    }
}