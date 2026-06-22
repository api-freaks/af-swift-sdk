import Foundation

public struct GeolocationLookupResponse: Codable, Hashable, Sendable {
    /// The IP address
    public let ip: String?
    /// The hostname (if available)
    public let hostname: String?
    public let location: GeolocationLookupResponseLocation?
    public let countryMetadata: GeolocationLookupResponseCountryMetadata?
    public let network: GeolocationLookupResponseNetwork?
    public let currency: GeolocationLookupResponseCurrency?
    public let security: GeolocationLookupResponseSecurity?
    public let abuse: GeolocationLookupResponseAbuseItem?
    public let timeZone: GeolocationLookupResponseTimeZone?
    public let userAgent: GeolocationLookupResponseUserAgent?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String? = nil,
        hostname: String? = nil,
        location: GeolocationLookupResponseLocation? = nil,
        countryMetadata: GeolocationLookupResponseCountryMetadata? = nil,
        network: GeolocationLookupResponseNetwork? = nil,
        currency: GeolocationLookupResponseCurrency? = nil,
        security: GeolocationLookupResponseSecurity? = nil,
        abuse: GeolocationLookupResponseAbuseItem? = nil,
        timeZone: GeolocationLookupResponseTimeZone? = nil,
        userAgent: GeolocationLookupResponseUserAgent? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.hostname = hostname
        self.location = location
        self.countryMetadata = countryMetadata
        self.network = network
        self.currency = currency
        self.security = security
        self.abuse = abuse
        self.timeZone = timeZone
        self.userAgent = userAgent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.hostname = try container.decodeIfPresent(String.self, forKey: .hostname)
        self.location = try container.decodeIfPresent(GeolocationLookupResponseLocation.self, forKey: .location)
        self.countryMetadata = try container.decodeIfPresent(GeolocationLookupResponseCountryMetadata.self, forKey: .countryMetadata)
        self.network = try container.decodeIfPresent(GeolocationLookupResponseNetwork.self, forKey: .network)
        self.currency = try container.decodeIfPresent(GeolocationLookupResponseCurrency.self, forKey: .currency)
        self.security = try container.decodeIfPresent(GeolocationLookupResponseSecurity.self, forKey: .security)
        self.abuse = try container.decodeIfPresent(GeolocationLookupResponseAbuseItem.self, forKey: .abuse)
        self.timeZone = try container.decodeIfPresent(GeolocationLookupResponseTimeZone.self, forKey: .timeZone)
        self.userAgent = try container.decodeIfPresent(GeolocationLookupResponseUserAgent.self, forKey: .userAgent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.hostname, forKey: .hostname)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.countryMetadata, forKey: .countryMetadata)
        try container.encodeIfPresent(self.network, forKey: .network)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.security, forKey: .security)
        try container.encodeIfPresent(self.abuse, forKey: .abuse)
        try container.encodeIfPresent(self.timeZone, forKey: .timeZone)
        try container.encodeIfPresent(self.userAgent, forKey: .userAgent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case hostname
        case location
        case countryMetadata = "country_metadata"
        case network
        case currency
        case security
        case abuse
        case timeZone = "time_zone"
        case userAgent = "user_agent"
    }
}