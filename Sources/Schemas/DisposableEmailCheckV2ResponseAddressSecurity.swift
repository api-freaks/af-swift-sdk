import Foundation

/// Threat and anonymity profile for the IP address.
public struct DisposableEmailCheckV2ResponseAddressSecurity: Codable, Hashable, Sendable {
    /// Quantitative risk assessment score. Higher values indicate elevated security risk.
    public let threatScore: Int
    /// Detection flag for IP addresses routed through the Tor anonymity network.
    public let isTor: Bool
    /// Detection flag identifying IP addresses operating as proxy servers.
    public let isProxy: Bool
    /// Classification of detected proxy infrastructure type (e.g. VPN, HTTP, SOCKS). Included only when is_proxy is true.
    public let proxyType: String?
    /// Identified service provider operating the proxy infrastructure. Included only when is_proxy is true.
    public let proxyProvider: String?
    /// Anonymization detection flag for IP addresses using identity obfuscation techniques.
    public let isAnonymous: Bool
    /// Threat intelligence flag for IP addresses documented as confirmed malicious sources.
    public let isKnownAttacker: Bool
    /// Reputation flag for IP addresses associated with spam transmission.
    public let isSpam: Bool
    /// Automated traffic detection flag for IP addresses from bot networks.
    public let isBot: Bool
    /// Infrastructure classification flag for IP addresses from cloud computing providers.
    public let isCloudProvider: Bool
    /// Identified cloud infrastructure or hosting service provider name.
    public let cloudProvider: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        threatScore: Int,
        isTor: Bool,
        isProxy: Bool,
        proxyType: String? = nil,
        proxyProvider: String? = nil,
        isAnonymous: Bool,
        isKnownAttacker: Bool,
        isSpam: Bool,
        isBot: Bool,
        isCloudProvider: Bool,
        cloudProvider: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.threatScore = threatScore
        self.isTor = isTor
        self.isProxy = isProxy
        self.proxyType = proxyType
        self.proxyProvider = proxyProvider
        self.isAnonymous = isAnonymous
        self.isKnownAttacker = isKnownAttacker
        self.isSpam = isSpam
        self.isBot = isBot
        self.isCloudProvider = isCloudProvider
        self.cloudProvider = cloudProvider
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.threatScore = try container.decode(Int.self, forKey: .threatScore)
        self.isTor = try container.decode(Bool.self, forKey: .isTor)
        self.isProxy = try container.decode(Bool.self, forKey: .isProxy)
        self.proxyType = try container.decodeIfPresent(String.self, forKey: .proxyType)
        self.proxyProvider = try container.decodeIfPresent(String.self, forKey: .proxyProvider)
        self.isAnonymous = try container.decode(Bool.self, forKey: .isAnonymous)
        self.isKnownAttacker = try container.decode(Bool.self, forKey: .isKnownAttacker)
        self.isSpam = try container.decode(Bool.self, forKey: .isSpam)
        self.isBot = try container.decode(Bool.self, forKey: .isBot)
        self.isCloudProvider = try container.decode(Bool.self, forKey: .isCloudProvider)
        self.cloudProvider = try container.decode(String.self, forKey: .cloudProvider)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.threatScore, forKey: .threatScore)
        try container.encode(self.isTor, forKey: .isTor)
        try container.encode(self.isProxy, forKey: .isProxy)
        try container.encodeIfPresent(self.proxyType, forKey: .proxyType)
        try container.encodeIfPresent(self.proxyProvider, forKey: .proxyProvider)
        try container.encode(self.isAnonymous, forKey: .isAnonymous)
        try container.encode(self.isKnownAttacker, forKey: .isKnownAttacker)
        try container.encode(self.isSpam, forKey: .isSpam)
        try container.encode(self.isBot, forKey: .isBot)
        try container.encode(self.isCloudProvider, forKey: .isCloudProvider)
        try container.encode(self.cloudProvider, forKey: .cloudProvider)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case threatScore = "threat_score"
        case isTor = "is_tor"
        case isProxy = "is_proxy"
        case proxyType = "proxy_type"
        case proxyProvider = "proxy_provider"
        case isAnonymous = "is_anonymous"
        case isKnownAttacker = "is_known_attacker"
        case isSpam = "is_spam"
        case isBot = "is_bot"
        case isCloudProvider = "is_cloud_provider"
        case cloudProvider = "cloud_provider"
    }
}