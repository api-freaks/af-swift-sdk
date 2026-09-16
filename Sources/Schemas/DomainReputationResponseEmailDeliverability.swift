import Foundation

/// Assessment of the domain's ability to send and receive email reliably.
public struct DomainReputationResponseEmailDeliverability: Codable, Hashable, Sendable {
    /// Overall email deliverability score out of 100.
    public let score: Int
    /// Letter / word grade summarizing the deliverability score.
    public let grade: String
    /// Indicates whether the domain is configured to receive email.
    public let canReceiveEmail: Bool
    /// Email authentication mechanisms configured for the domain.
    public let authentication: DomainReputationResponseEmailDeliverabilityAuthentication
    /// Mail server infrastructure backing the domain.
    public let infrastructure: DomainReputationResponseEmailDeliverabilityInfrastructure
    /// Reputation and trust signals related to the domain's email sending history.
    public let reputation: DomainReputationResponseEmailDeliverabilityReputation
    /// List of detected email deliverability issues or misconfigurations.
    public let issues: [DomainReputationResponseEmailDeliverabilityIssuesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        score: Int,
        grade: String,
        canReceiveEmail: Bool,
        authentication: DomainReputationResponseEmailDeliverabilityAuthentication,
        infrastructure: DomainReputationResponseEmailDeliverabilityInfrastructure,
        reputation: DomainReputationResponseEmailDeliverabilityReputation,
        issues: [DomainReputationResponseEmailDeliverabilityIssuesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.score = score
        self.grade = grade
        self.canReceiveEmail = canReceiveEmail
        self.authentication = authentication
        self.infrastructure = infrastructure
        self.reputation = reputation
        self.issues = issues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.score = try container.decode(Int.self, forKey: .score)
        self.grade = try container.decode(String.self, forKey: .grade)
        self.canReceiveEmail = try container.decode(Bool.self, forKey: .canReceiveEmail)
        self.authentication = try container.decode(DomainReputationResponseEmailDeliverabilityAuthentication.self, forKey: .authentication)
        self.infrastructure = try container.decode(DomainReputationResponseEmailDeliverabilityInfrastructure.self, forKey: .infrastructure)
        self.reputation = try container.decode(DomainReputationResponseEmailDeliverabilityReputation.self, forKey: .reputation)
        self.issues = try container.decode([DomainReputationResponseEmailDeliverabilityIssuesItem].self, forKey: .issues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.score, forKey: .score)
        try container.encode(self.grade, forKey: .grade)
        try container.encode(self.canReceiveEmail, forKey: .canReceiveEmail)
        try container.encode(self.authentication, forKey: .authentication)
        try container.encode(self.infrastructure, forKey: .infrastructure)
        try container.encode(self.reputation, forKey: .reputation)
        try container.encode(self.issues, forKey: .issues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case score
        case grade
        case canReceiveEmail = "can_receive_email"
        case authentication
        case infrastructure
        case reputation
        case issues
    }
}