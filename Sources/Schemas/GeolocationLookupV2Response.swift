import Foundation

public struct GeolocationLookupV2Response: Codable, Hashable, Sendable {
    /// The IP address used for the lookup (IPv4 or IPv6).
    public let ip: String
    /// The input domain, returned only for domain-based lookups.
    public let domain: String?
    /// Reverse DNS hostname (PTR) for the input IP; returns the input IP if not resolvable.
    public let hostname: String?
    /// Geographic location information for the IP.
    public let location: GeolocationLookupV2ResponseLocation?
    /// Country-specific metadata.
    public let countryMetadata: GeolocationLookupV2ResponseCountryMetadata?
    /// Network information for the IP.
    public let network: GeolocationLookupV2ResponseNetwork?
    /// Autonomous System details for the IP.
    public let asn: GeolocationLookupV2ResponseAsn?
    /// Company or ISP information mapped to the IP address.
    public let company: GeolocationLookupV2ResponseCompany?
    /// Currency information for the IP's country.
    public let currency: GeolocationLookupV2ResponseCurrency?
    /// Threat intelligence and security information for the IP.
    public let security: GeolocationLookupV2ResponseSecurity?
    /// Abuse contact information for the IP.
    public let abuse: GeolocationLookupV2ResponseAbuse?
    /// Time zone information for the IP's location.
    public let timeZone: GeolocationLookupV2ResponseTimeZone?
    /// Parsed User-Agent details from the request.
    public let userAgent: GeolocationLookupV2ResponseUserAgent?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String,
        domain: String? = nil,
        hostname: String? = nil,
        location: GeolocationLookupV2ResponseLocation? = nil,
        countryMetadata: GeolocationLookupV2ResponseCountryMetadata? = nil,
        network: GeolocationLookupV2ResponseNetwork? = nil,
        asn: GeolocationLookupV2ResponseAsn? = nil,
        company: GeolocationLookupV2ResponseCompany? = nil,
        currency: GeolocationLookupV2ResponseCurrency? = nil,
        security: GeolocationLookupV2ResponseSecurity? = nil,
        abuse: GeolocationLookupV2ResponseAbuse? = nil,
        timeZone: GeolocationLookupV2ResponseTimeZone? = nil,
        userAgent: GeolocationLookupV2ResponseUserAgent? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.domain = domain
        self.hostname = hostname
        self.location = location
        self.countryMetadata = countryMetadata
        self.network = network
        self.asn = asn
        self.company = company
        self.currency = currency
        self.security = security
        self.abuse = abuse
        self.timeZone = timeZone
        self.userAgent = userAgent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decode(String.self, forKey: .ip)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.hostname = try container.decodeIfPresent(String.self, forKey: .hostname)
        self.location = try container.decodeIfPresent(GeolocationLookupV2ResponseLocation.self, forKey: .location)
        self.countryMetadata = try container.decodeIfPresent(GeolocationLookupV2ResponseCountryMetadata.self, forKey: .countryMetadata)
        self.network = try container.decodeIfPresent(GeolocationLookupV2ResponseNetwork.self, forKey: .network)
        self.asn = try container.decodeIfPresent(GeolocationLookupV2ResponseAsn.self, forKey: .asn)
        self.company = try container.decodeIfPresent(GeolocationLookupV2ResponseCompany.self, forKey: .company)
        self.currency = try container.decodeIfPresent(GeolocationLookupV2ResponseCurrency.self, forKey: .currency)
        self.security = try container.decodeIfPresent(GeolocationLookupV2ResponseSecurity.self, forKey: .security)
        self.abuse = try container.decodeIfPresent(GeolocationLookupV2ResponseAbuse.self, forKey: .abuse)
        self.timeZone = try container.decodeIfPresent(GeolocationLookupV2ResponseTimeZone.self, forKey: .timeZone)
        self.userAgent = try container.decodeIfPresent(GeolocationLookupV2ResponseUserAgent.self, forKey: .userAgent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.hostname, forKey: .hostname)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.countryMetadata, forKey: .countryMetadata)
        try container.encodeIfPresent(self.network, forKey: .network)
        try container.encodeIfPresent(self.asn, forKey: .asn)
        try container.encodeIfPresent(self.company, forKey: .company)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.security, forKey: .security)
        try container.encodeIfPresent(self.abuse, forKey: .abuse)
        try container.encodeIfPresent(self.timeZone, forKey: .timeZone)
        try container.encodeIfPresent(self.userAgent, forKey: .userAgent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case domain
        case hostname
        case location
        case countryMetadata = "country_metadata"
        case network
        case asn
        case company
        case currency
        case security
        case abuse
        case timeZone = "time_zone"
        case userAgent = "user_agent"
    }
}