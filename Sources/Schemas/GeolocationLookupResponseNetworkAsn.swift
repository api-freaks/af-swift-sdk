import Foundation

public struct GeolocationLookupResponseNetworkAsn: Codable, Hashable, Sendable {
    /// The AS number
    public let asNumber: String?
    /// The organization name
    public let organization: String?
    /// The country code
    public let country: String?
    /// The ASN name
    public let asnName: String?
    /// The type of the ASN
    public let type: String?
    /// The domain associated with the ASN
    public let domain: String?
    /// The date when the ASN was allocated
    public let dateAllocated: String?
    /// The allocation status of the ASN
    public let allocationStatus: String?
    /// The number of IPv4 routes associated with the ASN
    public let numOfIpv4Routes: String?
    /// The number of IPv6 routes associated with the ASN
    public let numOfIpv6Routes: String?
    /// The Regional Internet Registry (RIR) of the ASN
    public let rir: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asNumber: String? = nil,
        organization: String? = nil,
        country: String? = nil,
        asnName: String? = nil,
        type: String? = nil,
        domain: String? = nil,
        dateAllocated: String? = nil,
        allocationStatus: String? = nil,
        numOfIpv4Routes: String? = nil,
        numOfIpv6Routes: String? = nil,
        rir: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asNumber = asNumber
        self.organization = organization
        self.country = country
        self.asnName = asnName
        self.type = type
        self.domain = domain
        self.dateAllocated = dateAllocated
        self.allocationStatus = allocationStatus
        self.numOfIpv4Routes = numOfIpv4Routes
        self.numOfIpv6Routes = numOfIpv6Routes
        self.rir = rir
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asNumber = try container.decodeIfPresent(String.self, forKey: .asNumber)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.asnName = try container.decodeIfPresent(String.self, forKey: .asnName)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.dateAllocated = try container.decodeIfPresent(String.self, forKey: .dateAllocated)
        self.allocationStatus = try container.decodeIfPresent(String.self, forKey: .allocationStatus)
        self.numOfIpv4Routes = try container.decodeIfPresent(String.self, forKey: .numOfIpv4Routes)
        self.numOfIpv6Routes = try container.decodeIfPresent(String.self, forKey: .numOfIpv6Routes)
        self.rir = try container.decodeIfPresent(String.self, forKey: .rir)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.asNumber, forKey: .asNumber)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.asnName, forKey: .asnName)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.dateAllocated, forKey: .dateAllocated)
        try container.encodeIfPresent(self.allocationStatus, forKey: .allocationStatus)
        try container.encodeIfPresent(self.numOfIpv4Routes, forKey: .numOfIpv4Routes)
        try container.encodeIfPresent(self.numOfIpv6Routes, forKey: .numOfIpv6Routes)
        try container.encodeIfPresent(self.rir, forKey: .rir)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asNumber = "as_number"
        case organization
        case country
        case asnName = "asn_name"
        case type
        case domain
        case dateAllocated = "date_allocated"
        case allocationStatus = "allocation_status"
        case numOfIpv4Routes = "num_of_ipv4_routes"
        case numOfIpv6Routes = "num_of_ipv6_routes"
        case rir
    }
}