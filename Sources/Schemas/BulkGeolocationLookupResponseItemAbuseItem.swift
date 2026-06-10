import Foundation

public struct BulkGeolocationLookupResponseItemAbuseItem: Codable, Hashable, Sendable {
    /// The IP range of the abuse contact
    public let route: String?
    /// The country code of the abuse contact
    public let country: String?
    /// The handle of the abuse contact
    public let handle: String?
    /// The name of the abuse contact
    public let name: String?
    /// The organization of the abuse contact
    public let organization: String?
    /// The role of the abuse contact
    public let role: String?
    /// The kind of the abuse contact
    public let kind: String?
    /// The address of the abuse contact
    public let address: String?
    /// The list of email addresses of the abuse contact
    public let emails: [String]?
    /// The list of phone numbers of the abuse contact
    public let phoneNumbers: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        route: String? = nil,
        country: String? = nil,
        handle: String? = nil,
        name: String? = nil,
        organization: String? = nil,
        role: String? = nil,
        kind: String? = nil,
        address: String? = nil,
        emails: [String]? = nil,
        phoneNumbers: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.route = route
        self.country = country
        self.handle = handle
        self.name = name
        self.organization = organization
        self.role = role
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
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.role = try container.decodeIfPresent(String.self, forKey: .role)
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
        try container.encodeIfPresent(self.handle, forKey: .handle)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.emails, forKey: .emails)
        try container.encodeIfPresent(self.phoneNumbers, forKey: .phoneNumbers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case route
        case country
        case handle
        case name
        case organization
        case role
        case kind
        case address
        case emails
        case phoneNumbers = "phone_numbers"
    }
}