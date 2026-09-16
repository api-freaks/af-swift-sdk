import Foundation

/// Abuse contact information for the IP.
public struct BulkGeolocationLookupV2ResponseItemAbuseAbuse: Codable, Hashable, Sendable {
    /// Abuse-handling IP range in CIDR notation.
    public let route: String?
    /// ISO 3166-1 alpha-2 country code of the abuse contact.
    public let country: String?
    /// Display name for the abuse contact.
    public let name: String?
    /// Organization name for the abuse contact.
    public let organization: String?
    /// Contact type: group or individual.
    public let kind: String?
    /// Registered address of the organization owning the IP.
    public let address: String?
    /// Abuse contact email addresses.
    public let emails: [String]?
    /// Abuse contact phone numbers.
    public let phoneNumbers: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        route: String? = nil,
        country: String? = nil,
        name: String? = nil,
        organization: String? = nil,
        kind: String? = nil,
        address: String? = nil,
        emails: [String]? = nil,
        phoneNumbers: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.route = route
        self.country = country
        self.name = name
        self.organization = organization
        self.kind = kind
        self.address = address
        self.emails = emails
        self.phoneNumbers = phoneNumbers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.route = try container.decodeIfPresent(String.self, forKey: .route)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.emails = try container.decodeIfPresent([String].self, forKey: .emails)
        self.phoneNumbers = try container.decodeIfPresent([String].self, forKey: .phoneNumbers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.route, forKey: .route)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.emails, forKey: .emails)
        try container.encodeIfPresent(self.phoneNumbers, forKey: .phoneNumbers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case route
        case country
        case name
        case organization
        case kind
        case address
        case emails
        case phoneNumbers = "phone_numbers"
    }
}