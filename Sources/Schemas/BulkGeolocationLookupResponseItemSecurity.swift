import Foundation

public struct BulkGeolocationLookupResponseItemSecurity: Codable, Hashable, Sendable {
    public let threatScore: Double?
    public let isTor: Bool?
    public let isProxy: Bool?
    public let proxyType: String?
    public let proxyProvider: String?
    public let isAnonymous: Bool?
    public let isKnownAttacker: Bool?
    public let isSpam: Bool?
    public let isBot: Bool?
    public let isCloudProvider: Bool?
    public let cloudProvider: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        threatScore: Double? = nil,
        isTor: Bool? = nil,
        isProxy: Bool? = nil,
        proxyType: String? = nil,
        proxyProvider: String? = nil,
        isAnonymous: Bool? = nil,
        isKnownAttacker: Bool? = nil,
        isSpam: Bool? = nil,
        isBot: Bool? = nil,
        isCloudProvider: Bool? = nil,
        cloudProvider: String? = nil,
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
        self.threatScore = try container.decodeIfPresent(Double.self, forKey: .threatScore)
        self.isTor = try container.decodeIfPresent(Bool.self, forKey: .isTor)
        self.isProxy = try container.decodeIfPresent(Bool.self, forKey: .isProxy)
        self.proxyType = try container.decodeIfPresent(String.self, forKey: .proxyType)
        self.proxyProvider = try container.decodeIfPresent(String.self, forKey: .proxyProvider)
        self.isAnonymous = try container.decodeIfPresent(Bool.self, forKey: .isAnonymous)
        self.isKnownAttacker = try container.decodeIfPresent(Bool.self, forKey: .isKnownAttacker)
        self.isSpam = try container.decodeIfPresent(Bool.self, forKey: .isSpam)
        self.isBot = try container.decodeIfPresent(Bool.self, forKey: .isBot)
        self.isCloudProvider = try container.decodeIfPresent(Bool.self, forKey: .isCloudProvider)
        self.cloudProvider = try container.decodeIfPresent(String.self, forKey: .cloudProvider)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.threatScore, forKey: .threatScore)
        try container.encodeIfPresent(self.isTor, forKey: .isTor)
        try container.encodeIfPresent(self.isProxy, forKey: .isProxy)
        try container.encodeIfPresent(self.proxyType, forKey: .proxyType)
        try container.encodeIfPresent(self.proxyProvider, forKey: .proxyProvider)
        try container.encodeIfPresent(self.isAnonymous, forKey: .isAnonymous)
        try container.encodeIfPresent(self.isKnownAttacker, forKey: .isKnownAttacker)
        try container.encodeIfPresent(self.isSpam, forKey: .isSpam)
        try container.encodeIfPresent(self.isBot, forKey: .isBot)
        try container.encodeIfPresent(self.isCloudProvider, forKey: .isCloudProvider)
        try container.encodeIfPresent(self.cloudProvider, forKey: .cloudProvider)
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