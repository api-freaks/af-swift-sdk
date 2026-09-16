import Foundation

/// Individual trust / risk indicators for the domain.
public struct DomainReputationResponseTrustSignalsIndicators: Codable, Hashable, Sendable {
    /// Indicates whether the domain was recently registered. null when WHOIS data is unavailable.
    public let isNewlyRegistered: Nullable<Bool>?
    /// Indicates whether the domain uses a free TLD extension.
    public let usesFreeExtension: Bool?
    /// Indicates whether the domain uses a free SSL certificate.
    public let usesFreeSsl: Bool?
    /// Indicates whether WHOIS privacy protection is enabled. null when WHOIS data is unavailable.
    public let hasPrivacyWhois: Nullable<Bool>?
    /// Age of the SSL certificate in days.
    public let sslAgeDays: Nullable<Int>?
    /// Indicates whether a DMARC record exists.
    public let hasDmarc: Bool?
    /// Indicates whether an SPF record exists.
    public let hasSpf: Bool?
    /// Indicates whether the domain redirects to an external site.
    public let redirectsExternally: Bool?
    /// Indicates whether obfuscated JavaScript was detected.
    public let javascriptObfuscated: Bool?
    /// Age of the domain in days. null when WHOIS data is unavailable.
    public let domainAgeDays: Nullable<Int>?
    /// Domain registrar name. null when WHOIS data is unavailable.
    public let registrar: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        isNewlyRegistered: Nullable<Bool>? = nil,
        usesFreeExtension: Bool? = nil,
        usesFreeSsl: Bool? = nil,
        hasPrivacyWhois: Nullable<Bool>? = nil,
        sslAgeDays: Nullable<Int>? = nil,
        hasDmarc: Bool? = nil,
        hasSpf: Bool? = nil,
        redirectsExternally: Bool? = nil,
        javascriptObfuscated: Bool? = nil,
        domainAgeDays: Nullable<Int>? = nil,
        registrar: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.isNewlyRegistered = isNewlyRegistered
        self.usesFreeExtension = usesFreeExtension
        self.usesFreeSsl = usesFreeSsl
        self.hasPrivacyWhois = hasPrivacyWhois
        self.sslAgeDays = sslAgeDays
        self.hasDmarc = hasDmarc
        self.hasSpf = hasSpf
        self.redirectsExternally = redirectsExternally
        self.javascriptObfuscated = javascriptObfuscated
        self.domainAgeDays = domainAgeDays
        self.registrar = registrar
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isNewlyRegistered = try container.decodeNullableIfPresent(Bool.self, forKey: .isNewlyRegistered)
        self.usesFreeExtension = try container.decodeIfPresent(Bool.self, forKey: .usesFreeExtension)
        self.usesFreeSsl = try container.decodeIfPresent(Bool.self, forKey: .usesFreeSsl)
        self.hasPrivacyWhois = try container.decodeNullableIfPresent(Bool.self, forKey: .hasPrivacyWhois)
        self.sslAgeDays = try container.decodeNullableIfPresent(Int.self, forKey: .sslAgeDays)
        self.hasDmarc = try container.decodeIfPresent(Bool.self, forKey: .hasDmarc)
        self.hasSpf = try container.decodeIfPresent(Bool.self, forKey: .hasSpf)
        self.redirectsExternally = try container.decodeIfPresent(Bool.self, forKey: .redirectsExternally)
        self.javascriptObfuscated = try container.decodeIfPresent(Bool.self, forKey: .javascriptObfuscated)
        self.domainAgeDays = try container.decodeNullableIfPresent(Int.self, forKey: .domainAgeDays)
        self.registrar = try container.decodeNullableIfPresent(String.self, forKey: .registrar)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.isNewlyRegistered, forKey: .isNewlyRegistered)
        try container.encodeIfPresent(self.usesFreeExtension, forKey: .usesFreeExtension)
        try container.encodeIfPresent(self.usesFreeSsl, forKey: .usesFreeSsl)
        try container.encodeNullableIfPresent(self.hasPrivacyWhois, forKey: .hasPrivacyWhois)
        try container.encodeNullableIfPresent(self.sslAgeDays, forKey: .sslAgeDays)
        try container.encodeIfPresent(self.hasDmarc, forKey: .hasDmarc)
        try container.encodeIfPresent(self.hasSpf, forKey: .hasSpf)
        try container.encodeIfPresent(self.redirectsExternally, forKey: .redirectsExternally)
        try container.encodeIfPresent(self.javascriptObfuscated, forKey: .javascriptObfuscated)
        try container.encodeNullableIfPresent(self.domainAgeDays, forKey: .domainAgeDays)
        try container.encodeNullableIfPresent(self.registrar, forKey: .registrar)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case isNewlyRegistered = "is_newly_registered"
        case usesFreeExtension = "uses_free_extension"
        case usesFreeSsl = "uses_free_ssl"
        case hasPrivacyWhois = "has_privacy_whois"
        case sslAgeDays = "ssl_age_days"
        case hasDmarc = "has_dmarc"
        case hasSpf = "has_spf"
        case redirectsExternally = "redirects_externally"
        case javascriptObfuscated = "javascript_obfuscated"
        case domainAgeDays = "domain_age_days"
        case registrar
    }
}