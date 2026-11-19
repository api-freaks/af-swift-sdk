import Foundation

/// Current registration status of the domain.
public struct DomainReputationResponseRegistration: Codable, Hashable, Sendable {
    /// Registration status of the domain, for example `registered` or `not_registered`.
    public let status: String
    /// Number of earlier registrations found for the domain. Returned when the domain is not currently registered (for example `0`).
    public let pastRegistrations: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: String,
        pastRegistrations: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.pastRegistrations = pastRegistrations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.pastRegistrations = try container.decodeIfPresent(Int.self, forKey: .pastRegistrations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.pastRegistrations, forKey: .pastRegistrations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case pastRegistrations = "past_registrations"
    }
}