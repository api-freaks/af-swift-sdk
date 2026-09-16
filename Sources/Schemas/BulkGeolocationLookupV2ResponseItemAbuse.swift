import Foundation

/// Geolocation and threat intelligence result for one successfully resolved IP address.
public struct BulkGeolocationLookupV2ResponseItemAbuse: Codable, Hashable, Sendable {
    /// The IP address used for the lookup (IPv4 or IPv6).
    public let ip: String
    /// The input domain, returned only for domain-based lookups.
    public let domain: String?
    /// Reverse DNS hostname (PTR) for the input IP; returns the input IP if not resolvable.
    public let hostname: String?
    /// Geographic location information for the IP.
    public let location: BulkGeolocationLookupV2ResponseItemAbuseLocation?
    /// Country-specific metadata.
    public let countryMetadata: BulkGeolocationLookupV2ResponseItemAbuseCountryMetadata?
    /// Network information for the IP.
    public let network: BulkGeolocationLookupV2ResponseItemAbuseNetwork?
    /// Autonomous System details for the IP.
    public let asn: BulkGeolocationLookupV2ResponseItemAbuseAsn?
    /// Company or ISP information mapped to the IP address.
    public let company: BulkGeolocationLookupV2ResponseItemAbuseCompany?
    /// Currency information for the IP's country.
    public let currency: BulkGeolocationLookupV2ResponseItemAbuseCurrency?
    /// Threat intelligence and security information for the IP.
    public let security: BulkGeolocationLookupV2ResponseItemAbuseSecurity?
    /// Abuse contact information for the IP.
    public let abuse: BulkGeolocationLookupV2ResponseItemAbuseAbuse?
    /// Time zone information for the IP's location.
    public let timeZone: BulkGeolocationLookupV2ResponseItemAbuseTimeZone?
    /// Parsed User-Agent details from the request.
    public let userAgent: BulkGeolocationLookupV2ResponseItemAbuseUserAgent?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String,
        domain: String? = nil,
        hostname: String? = nil,
        location: BulkGeolocationLookupV2ResponseItemAbuseLocation? = nil,
        countryMetadata: BulkGeolocationLookupV2ResponseItemAbuseCountryMetadata? = nil,
        network: BulkGeolocationLookupV2ResponseItemAbuseNetwork? = nil,
        asn: BulkGeolocationLookupV2ResponseItemAbuseAsn? = nil,
        company: BulkGeolocationLookupV2ResponseItemAbuseCompany? = nil,
        currency: BulkGeolocationLookupV2ResponseItemAbuseCurrency? = nil,
        security: BulkGeolocationLookupV2ResponseItemAbuseSecurity? = nil,
        abuse: BulkGeolocationLookupV2ResponseItemAbuseAbuse? = nil,
        timeZone: BulkGeolocationLookupV2ResponseItemAbuseTimeZone? = nil,
        userAgent: BulkGeolocationLookupV2ResponseItemAbuseUserAgent? = nil,
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
        self.location = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseLocation.self, forKey: .location)
        self.countryMetadata = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseCountryMetadata.self, forKey: .countryMetadata)
        self.network = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseNetwork.self, forKey: .network)
        self.asn = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseAsn.self, forKey: .asn)
        self.company = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseCompany.self, forKey: .company)
        self.currency = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseCurrency.self, forKey: .currency)
        self.security = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseSecurity.self, forKey: .security)
        self.abuse = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseAbuse.self, forKey: .abuse)
        self.timeZone = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseTimeZone.self, forKey: .timeZone)
        self.userAgent = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseUserAgent.self, forKey: .userAgent)
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