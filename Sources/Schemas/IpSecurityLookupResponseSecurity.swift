import Foundation

public struct IpSecurityLookupResponseSecurity: Codable, Hashable, Sendable {
    public let threatScore: Double?
    public let isTor: Bool?
    public let isProxy: Bool?
    public let proxyProviderNames: [String]?
    public let proxyConfidenceScore: Double?
    public let proxyLastSeen: String?
    public let isResidentialProxy: Bool?
    public let isVpn: Bool?
    public let vpnProviderNames: [String]?
    public let vpnConfidenceScore: Double?
    public let vpnLastSeen: String?
    public let isRelay: Bool?
    public let relayProviderName: String?
    public let isAnonymous: Bool?
    public let isKnownAttacker: Bool?
    public let isBot: Bool?
    public let isSpam: Bool?
    public let isCloudProvider: Bool?
    public let cloudProviderName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        threatScore: Double? = nil,
        isTor: Bool? = nil,
        isProxy: Bool? = nil,
        proxyProviderNames: [String]? = nil,
        proxyConfidenceScore: Double? = nil,
        proxyLastSeen: String? = nil,
        isResidentialProxy: Bool? = nil,
        isVpn: Bool? = nil,
        vpnProviderNames: [String]? = nil,
        vpnConfidenceScore: Double? = nil,
        vpnLastSeen: String? = nil,
        isRelay: Bool? = nil,
        relayProviderName: String? = nil,
        isAnonymous: Bool? = nil,
        isKnownAttacker: Bool? = nil,
        isBot: Bool? = nil,
        isSpam: Bool? = nil,
        isCloudProvider: Bool? = nil,
        cloudProviderName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.threatScore = threatScore
        self.isTor = isTor
        self.isProxy = isProxy
        self.proxyProviderNames = proxyProviderNames
        self.proxyConfidenceScore = proxyConfidenceScore
        self.proxyLastSeen = proxyLastSeen
        self.isResidentialProxy = isResidentialProxy
        self.isVpn = isVpn
        self.vpnProviderNames = vpnProviderNames
        self.vpnConfidenceScore = vpnConfidenceScore
        self.vpnLastSeen = vpnLastSeen
        self.isRelay = isRelay
        self.relayProviderName = relayProviderName
        self.isAnonymous = isAnonymous
        self.isKnownAttacker = isKnownAttacker
        self.isBot = isBot
        self.isSpam = isSpam
        self.isCloudProvider = isCloudProvider
        self.cloudProviderName = cloudProviderName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.threatScore = try container.decodeIfPresent(Double.self, forKey: .threatScore)
        self.isTor = try container.decodeIfPresent(Bool.self, forKey: .isTor)
        self.isProxy = try container.decodeIfPresent(Bool.self, forKey: .isProxy)
        self.proxyProviderNames = try container.decodeIfPresent([String].self, forKey: .proxyProviderNames)
        self.proxyConfidenceScore = try container.decodeIfPresent(Double.self, forKey: .proxyConfidenceScore)
        self.proxyLastSeen = try container.decodeIfPresent(String.self, forKey: .proxyLastSeen)
        self.isResidentialProxy = try container.decodeIfPresent(Bool.self, forKey: .isResidentialProxy)
        self.isVpn = try container.decodeIfPresent(Bool.self, forKey: .isVpn)
        self.vpnProviderNames = try container.decodeIfPresent([String].self, forKey: .vpnProviderNames)
        self.vpnConfidenceScore = try container.decodeIfPresent(Double.self, forKey: .vpnConfidenceScore)
        self.vpnLastSeen = try container.decodeIfPresent(String.self, forKey: .vpnLastSeen)
        self.isRelay = try container.decodeIfPresent(Bool.self, forKey: .isRelay)
        self.relayProviderName = try container.decodeIfPresent(String.self, forKey: .relayProviderName)
        self.isAnonymous = try container.decodeIfPresent(Bool.self, forKey: .isAnonymous)
        self.isKnownAttacker = try container.decodeIfPresent(Bool.self, forKey: .isKnownAttacker)
        self.isBot = try container.decodeIfPresent(Bool.self, forKey: .isBot)
        self.isSpam = try container.decodeIfPresent(Bool.self, forKey: .isSpam)
        self.isCloudProvider = try container.decodeIfPresent(Bool.self, forKey: .isCloudProvider)
        self.cloudProviderName = try container.decodeIfPresent(String.self, forKey: .cloudProviderName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.threatScore, forKey: .threatScore)
        try container.encodeIfPresent(self.isTor, forKey: .isTor)
        try container.encodeIfPresent(self.isProxy, forKey: .isProxy)
        try container.encodeIfPresent(self.proxyProviderNames, forKey: .proxyProviderNames)
        try container.encodeIfPresent(self.proxyConfidenceScore, forKey: .proxyConfidenceScore)
        try container.encodeIfPresent(self.proxyLastSeen, forKey: .proxyLastSeen)
        try container.encodeIfPresent(self.isResidentialProxy, forKey: .isResidentialProxy)
        try container.encodeIfPresent(self.isVpn, forKey: .isVpn)
        try container.encodeIfPresent(self.vpnProviderNames, forKey: .vpnProviderNames)
        try container.encodeIfPresent(self.vpnConfidenceScore, forKey: .vpnConfidenceScore)
        try container.encodeIfPresent(self.vpnLastSeen, forKey: .vpnLastSeen)
        try container.encodeIfPresent(self.isRelay, forKey: .isRelay)
        try container.encodeIfPresent(self.relayProviderName, forKey: .relayProviderName)
        try container.encodeIfPresent(self.isAnonymous, forKey: .isAnonymous)
        try container.encodeIfPresent(self.isKnownAttacker, forKey: .isKnownAttacker)
        try container.encodeIfPresent(self.isBot, forKey: .isBot)
        try container.encodeIfPresent(self.isSpam, forKey: .isSpam)
        try container.encodeIfPresent(self.isCloudProvider, forKey: .isCloudProvider)
        try container.encodeIfPresent(self.cloudProviderName, forKey: .cloudProviderName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case threatScore = "threat_score"
        case isTor = "is_tor"
        case isProxy = "is_proxy"
        case proxyProviderNames = "proxy_provider_names"
        case proxyConfidenceScore = "proxy_confidence_score"
        case proxyLastSeen = "proxy_last_seen"
        case isResidentialProxy = "is_residential_proxy"
        case isVpn = "is_vpn"
        case vpnProviderNames = "vpn_provider_names"
        case vpnConfidenceScore = "vpn_confidence_score"
        case vpnLastSeen = "vpn_last_seen"
        case isRelay = "is_relay"
        case relayProviderName = "relay_provider_name"
        case isAnonymous = "is_anonymous"
        case isKnownAttacker = "is_known_attacker"
        case isBot = "is_bot"
        case isSpam = "is_spam"
        case isCloudProvider = "is_cloud_provider"
        case cloudProviderName = "cloud_provider_name"
    }
}