import Foundation

/// Email authentication mechanisms configured for the domain.
public struct DomainReputationResponseEmailDeliverabilityAuthentication: Codable, Hashable, Sendable {
    /// Sender Policy Framework configuration.
    public let spf: DomainReputationResponseEmailDeliverabilityAuthenticationSpf
    /// DomainKeys Identified Mail configuration.
    public let dkim: DomainReputationResponseEmailDeliverabilityAuthenticationDkim
    /// Domain-based Message Authentication, Reporting and Conformance configuration.
    public let dmarc: DomainReputationResponseEmailDeliverabilityAuthenticationDmarc
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        spf: DomainReputationResponseEmailDeliverabilityAuthenticationSpf,
        dkim: DomainReputationResponseEmailDeliverabilityAuthenticationDkim,
        dmarc: DomainReputationResponseEmailDeliverabilityAuthenticationDmarc,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.spf = spf
        self.dkim = dkim
        self.dmarc = dmarc
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.spf = try container.decode(DomainReputationResponseEmailDeliverabilityAuthenticationSpf.self, forKey: .spf)
        self.dkim = try container.decode(DomainReputationResponseEmailDeliverabilityAuthenticationDkim.self, forKey: .dkim)
        self.dmarc = try container.decode(DomainReputationResponseEmailDeliverabilityAuthenticationDmarc.self, forKey: .dmarc)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.spf, forKey: .spf)
        try container.encode(self.dkim, forKey: .dkim)
        try container.encode(self.dmarc, forKey: .dmarc)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case spf
        case dkim
        case dmarc
    }
}