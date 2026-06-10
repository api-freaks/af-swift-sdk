import Foundation

public struct BulkEmailValidateResponseEmailValidationResponsesItemAddressSecurity: Codable, Hashable, Sendable {
    public let threatScore: Double
    public let isTor: Bool
    public let isProxy: Bool
    public let proxyType: String
    public let proxyProvider: String
    public let isAnonymous: Bool
    public let isKnownAttacker: Bool
    public let isSpam: Bool
    public let isBot: Bool
    public let isCloudProvider: Bool
    public let cloudProvider: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        threatScore: Double,
        isTor: Bool,
        isProxy: Bool,
        proxyType: String,
        proxyProvider: String,
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
        self.threatScore = try container.decode(Double.self, forKey: .threatScore)
        self.isTor = try container.decode(Bool.self, forKey: .isTor)
        self.isProxy = try container.decode(Bool.self, forKey: .isProxy)
        self.proxyType = try container.decode(String.self, forKey: .proxyType)
        self.proxyProvider = try container.decode(String.self, forKey: .proxyProvider)
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
        try container.encode(self.proxyType, forKey: .proxyType)
        try container.encode(self.proxyProvider, forKey: .proxyProvider)
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