import Foundation

/// Autonomous System details for the IP.
public struct GeolocationLookupV2ResponseAsn: Codable, Hashable, Sendable {
    /// ASN identifier in AS<number> format associated with the IP's network.
    public let asNumber: String?
    /// ASN operator name.
    public let organization: String?
    /// ASN registration country as ISO 3166-1 alpha-2.
    public let country: String?
    /// ASN category (ISP, HOSTING, BUSINESS, etc.).
    public let type: String?
    /// ASN operator domain name.
    public let domain: String?
    /// ASN allocation date in YYYY-MM-DD format.
    public let dateAllocated: String?
    /// Regional Internet Registry that allocated the ASN.
    public let rir: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asNumber: String? = nil,
        organization: String? = nil,
        country: String? = nil,
        type: String? = nil,
        domain: String? = nil,
        dateAllocated: String? = nil,
        rir: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asNumber = asNumber
        self.organization = organization
        self.country = country
        self.type = type
        self.domain = domain
        self.dateAllocated = dateAllocated
        self.rir = rir
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asNumber = try container.decodeIfPresent(String.self, forKey: .asNumber)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.dateAllocated = try container.decodeIfPresent(String.self, forKey: .dateAllocated)
        self.rir = try container.decodeIfPresent(String.self, forKey: .rir)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.asNumber, forKey: .asNumber)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.dateAllocated, forKey: .dateAllocated)
        try container.encodeIfPresent(self.rir, forKey: .rir)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asNumber = "as_number"
        case organization
        case country
        case type
        case domain
        case dateAllocated = "date_allocated"
        case rir
    }
}