import Foundation

/// Credit balances for the organization's subscription, subscription surcharge, and one-off purchases.
public struct GetCreditsUsageResponse: Codable, Hashable, Sendable {
    /// The API key the credit balances belong to.
    public let apiKey: String
    /// Status of the user account.
    public let userStatus: GetCreditsUsageResponseUserStatus
    /// Whether a subscription plan is currently active. Null if the account has no subscription.
    public let subActive: Nullable<Bool>?
    /// Status of the subscription credits. Null if the account has no subscription.
    public let subStatus: Nullable<GetCreditsUsageResponseSubStatus>?
    /// Total credits allowed under the subscription plan. Null if the account has no subscription.
    public let subAllowedCredits: Nullable<Int>?
    /// Credits consumed under the subscription plan. Null if the account has no subscription.
    public let subUsedCredits: Nullable<Int>?
    /// Status of the subscription surcharge (overage) credits. Null if the account has no subscription.
    public let subSurchargeStatus: Nullable<GetCreditsUsageResponseSubSurchargeStatus>?
    /// Total surcharge credits allowed. Null if the account has no subscription.
    public let subSurchargeAllowedCredits: Nullable<Int>?
    /// Surcharge credits consumed. Null if the account has no subscription.
    public let subSurchargeUsedCredits: Nullable<Int>?
    /// Whether surcharge (overage) usage is allowed on the subscription. Null if the account has no subscription.
    public let subSurchargeAllowed: Nullable<Bool>?
    /// Whether the account has active one-off (pay-as-you-go) credits.
    public let oneOffCreditsActive: Bool
    /// Total one-off credits purchased.
    public let oneOffAllowedCredits: Int
    /// One-off credits consumed.
    public let oneOffUsedCredits: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKey: String,
        userStatus: GetCreditsUsageResponseUserStatus,
        subActive: Nullable<Bool>? = nil,
        subStatus: Nullable<GetCreditsUsageResponseSubStatus>? = nil,
        subAllowedCredits: Nullable<Int>? = nil,
        subUsedCredits: Nullable<Int>? = nil,
        subSurchargeStatus: Nullable<GetCreditsUsageResponseSubSurchargeStatus>? = nil,
        subSurchargeAllowedCredits: Nullable<Int>? = nil,
        subSurchargeUsedCredits: Nullable<Int>? = nil,
        subSurchargeAllowed: Nullable<Bool>? = nil,
        oneOffCreditsActive: Bool,
        oneOffAllowedCredits: Int,
        oneOffUsedCredits: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKey = apiKey
        self.userStatus = userStatus
        self.subActive = subActive
        self.subStatus = subStatus
        self.subAllowedCredits = subAllowedCredits
        self.subUsedCredits = subUsedCredits
        self.subSurchargeStatus = subSurchargeStatus
        self.subSurchargeAllowedCredits = subSurchargeAllowedCredits
        self.subSurchargeUsedCredits = subSurchargeUsedCredits
        self.subSurchargeAllowed = subSurchargeAllowed
        self.oneOffCreditsActive = oneOffCreditsActive
        self.oneOffAllowedCredits = oneOffAllowedCredits
        self.oneOffUsedCredits = oneOffUsedCredits
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.userStatus = try container.decode(GetCreditsUsageResponseUserStatus.self, forKey: .userStatus)
        self.subActive = try container.decodeNullableIfPresent(Bool.self, forKey: .subActive)
        self.subStatus = try container.decodeNullableIfPresent(GetCreditsUsageResponseSubStatus.self, forKey: .subStatus)
        self.subAllowedCredits = try container.decodeNullableIfPresent(Int.self, forKey: .subAllowedCredits)
        self.subUsedCredits = try container.decodeNullableIfPresent(Int.self, forKey: .subUsedCredits)
        self.subSurchargeStatus = try container.decodeNullableIfPresent(GetCreditsUsageResponseSubSurchargeStatus.self, forKey: .subSurchargeStatus)
        self.subSurchargeAllowedCredits = try container.decodeNullableIfPresent(Int.self, forKey: .subSurchargeAllowedCredits)
        self.subSurchargeUsedCredits = try container.decodeNullableIfPresent(Int.self, forKey: .subSurchargeUsedCredits)
        self.subSurchargeAllowed = try container.decodeNullableIfPresent(Bool.self, forKey: .subSurchargeAllowed)
        self.oneOffCreditsActive = try container.decode(Bool.self, forKey: .oneOffCreditsActive)
        self.oneOffAllowedCredits = try container.decode(Int.self, forKey: .oneOffAllowedCredits)
        self.oneOffUsedCredits = try container.decode(Int.self, forKey: .oneOffUsedCredits)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encode(self.userStatus, forKey: .userStatus)
        try container.encodeNullableIfPresent(self.subActive, forKey: .subActive)
        try container.encodeNullableIfPresent(self.subStatus, forKey: .subStatus)
        try container.encodeNullableIfPresent(self.subAllowedCredits, forKey: .subAllowedCredits)
        try container.encodeNullableIfPresent(self.subUsedCredits, forKey: .subUsedCredits)
        try container.encodeNullableIfPresent(self.subSurchargeStatus, forKey: .subSurchargeStatus)
        try container.encodeNullableIfPresent(self.subSurchargeAllowedCredits, forKey: .subSurchargeAllowedCredits)
        try container.encodeNullableIfPresent(self.subSurchargeUsedCredits, forKey: .subSurchargeUsedCredits)
        try container.encodeNullableIfPresent(self.subSurchargeAllowed, forKey: .subSurchargeAllowed)
        try container.encode(self.oneOffCreditsActive, forKey: .oneOffCreditsActive)
        try container.encode(self.oneOffAllowedCredits, forKey: .oneOffAllowedCredits)
        try container.encode(self.oneOffUsedCredits, forKey: .oneOffUsedCredits)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey
        case userStatus
        case subActive
        case subStatus
        case subAllowedCredits
        case subUsedCredits
        case subSurchargeStatus
        case subSurchargeAllowedCredits
        case subSurchargeUsedCredits
        case subSurchargeAllowed
        case oneOffCreditsActive
        case oneOffAllowedCredits
        case oneOffUsedCredits
    }
}