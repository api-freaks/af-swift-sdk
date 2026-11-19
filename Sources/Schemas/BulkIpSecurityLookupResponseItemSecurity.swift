import Foundation

public struct BulkIpSecurityLookupResponseItemSecurity: Codable, Hashable, Sendable {
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
    /// Bot detection confidence from 0 to 100. 0 unless is_bot is true.
    public let botConfidenceScore: Double?
    /// Last observed bot activity date in YYYY-MM-DD, when available.
    public let botLastSeen: String?
    /// Organization running the bot, when known (mostly declared bots).
    public let botOperatorName: String?
    /// Kind of bot activity, when known. Declared bots (is_known_good_bot true): search_engine, ai_crawler, ai_assistant, seo_crawler, site_monitor, link_preview, feed_fetcher, archiver, ad_verification, scanner. Undeclared bots (is_known_good_bot false): scanner, scraper, exploit, credential_stuffing, brute_force, worm. New values can be added over time, so treat it as a plain string.
    public let botType: String?
    /// Corporate gateway provider name, when known.
    public let corporateGatewayProviderName: String?
    /// Kind of corporate gateway, when known. Known values: secure_web_gateway, browser_isolation.
    public let corporateGatewayType: String?
    /// true if the IP is an outbound address of a corporate security gateway (SWG, SSE, or SASE).
    public let isCorporateGateway: Bool?
    /// true if the bot is a declared bot with a verifiable operator (e.g. a search engine crawler or uptime monitor).
    public let isKnownGoodBot: Bool?
    /// Number of days in the last 30 days on which the IP was seen acting as a proxy. `0` when no proxy activity was observed.
    public let proxyDaysSeen30D: Int?
    /// Number of days in the last 7 days on which the IP was seen acting as a proxy. `0` when no proxy activity was observed.
    public let proxyDaysSeen7D: Int?
    /// Number of distinct proxy providers that offered the IP in the last 30 days. `0` when no proxy activity was observed.
    public let proxyProviderCount30D: Int?
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
        botConfidenceScore: Double? = nil,
        botLastSeen: String? = nil,
        botOperatorName: String? = nil,
        botType: String? = nil,
        corporateGatewayProviderName: String? = nil,
        corporateGatewayType: String? = nil,
        isCorporateGateway: Bool? = nil,
        isKnownGoodBot: Bool? = nil,
        proxyDaysSeen30D: Int? = nil,
        proxyDaysSeen7D: Int? = nil,
        proxyProviderCount30D: Int? = nil,
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
        self.botConfidenceScore = botConfidenceScore
        self.botLastSeen = botLastSeen
        self.botOperatorName = botOperatorName
        self.botType = botType
        self.corporateGatewayProviderName = corporateGatewayProviderName
        self.corporateGatewayType = corporateGatewayType
        self.isCorporateGateway = isCorporateGateway
        self.isKnownGoodBot = isKnownGoodBot
        self.proxyDaysSeen30D = proxyDaysSeen30D
        self.proxyDaysSeen7D = proxyDaysSeen7D
        self.proxyProviderCount30D = proxyProviderCount30D
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
        self.botConfidenceScore = try container.decodeIfPresent(Double.self, forKey: .botConfidenceScore)
        self.botLastSeen = try container.decodeIfPresent(String.self, forKey: .botLastSeen)
        self.botOperatorName = try container.decodeIfPresent(String.self, forKey: .botOperatorName)
        self.botType = try container.decodeIfPresent(String.self, forKey: .botType)
        self.corporateGatewayProviderName = try container.decodeIfPresent(String.self, forKey: .corporateGatewayProviderName)
        self.corporateGatewayType = try container.decodeIfPresent(String.self, forKey: .corporateGatewayType)
        self.isCorporateGateway = try container.decodeIfPresent(Bool.self, forKey: .isCorporateGateway)
        self.isKnownGoodBot = try container.decodeIfPresent(Bool.self, forKey: .isKnownGoodBot)
        self.proxyDaysSeen30D = try container.decodeIfPresent(Int.self, forKey: .proxyDaysSeen30D)
        self.proxyDaysSeen7D = try container.decodeIfPresent(Int.self, forKey: .proxyDaysSeen7D)
        self.proxyProviderCount30D = try container.decodeIfPresent(Int.self, forKey: .proxyProviderCount30D)
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
        try container.encodeIfPresent(self.botConfidenceScore, forKey: .botConfidenceScore)
        try container.encodeIfPresent(self.botLastSeen, forKey: .botLastSeen)
        try container.encodeIfPresent(self.botOperatorName, forKey: .botOperatorName)
        try container.encodeIfPresent(self.botType, forKey: .botType)
        try container.encodeIfPresent(self.corporateGatewayProviderName, forKey: .corporateGatewayProviderName)
        try container.encodeIfPresent(self.corporateGatewayType, forKey: .corporateGatewayType)
        try container.encodeIfPresent(self.isCorporateGateway, forKey: .isCorporateGateway)
        try container.encodeIfPresent(self.isKnownGoodBot, forKey: .isKnownGoodBot)
        try container.encodeIfPresent(self.proxyDaysSeen30D, forKey: .proxyDaysSeen30D)
        try container.encodeIfPresent(self.proxyDaysSeen7D, forKey: .proxyDaysSeen7D)
        try container.encodeIfPresent(self.proxyProviderCount30D, forKey: .proxyProviderCount30D)
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
        case botConfidenceScore = "bot_confidence_score"
        case botLastSeen = "bot_last_seen"
        case botOperatorName = "bot_operator_name"
        case botType = "bot_type"
        case corporateGatewayProviderName = "corporate_gateway_provider_name"
        case corporateGatewayType = "corporate_gateway_type"
        case isCorporateGateway = "is_corporate_gateway"
        case isKnownGoodBot = "is_known_good_bot"
        case proxyDaysSeen30D = "proxy_days_seen_30d"
        case proxyDaysSeen7D = "proxy_days_seen_7d"
        case proxyProviderCount30D = "proxy_provider_count_30d"
    }
}