import Foundation

public struct BulkEmailValidateResponseEmailValidationResponsesItem: Codable, Hashable, Sendable {
    public let success: Bool
    public let email: String
    public let name: String?
    public let reason: String?
    public let validEmail: BulkEmailValidateResponseEmailValidationResponsesItemValidEmail
    public let validSyntax: Bool
    public let domain: BulkEmailValidateResponseEmailValidationResponsesItemDomain
    public let account: BulkEmailValidateResponseEmailValidationResponsesItemAccount
    public let dns: BulkEmailValidateResponseEmailValidationResponsesItemDns
    public let ipAddress: String?
    public let address: BulkEmailValidateResponseEmailValidationResponsesItemAddress?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        email: String,
        name: String? = nil,
        reason: String? = nil,
        validEmail: BulkEmailValidateResponseEmailValidationResponsesItemValidEmail,
        validSyntax: Bool,
        domain: BulkEmailValidateResponseEmailValidationResponsesItemDomain,
        account: BulkEmailValidateResponseEmailValidationResponsesItemAccount,
        dns: BulkEmailValidateResponseEmailValidationResponsesItemDns,
        ipAddress: String? = nil,
        address: BulkEmailValidateResponseEmailValidationResponsesItemAddress? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.email = email
        self.name = name
        self.reason = reason
        self.validEmail = validEmail
        self.validSyntax = validSyntax
        self.domain = domain
        self.account = account
        self.dns = dns
        self.ipAddress = ipAddress
        self.address = address
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.email = try container.decode(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
        self.validEmail = try container.decode(BulkEmailValidateResponseEmailValidationResponsesItemValidEmail.self, forKey: .validEmail)
        self.validSyntax = try container.decode(Bool.self, forKey: .validSyntax)
        self.domain = try container.decode(BulkEmailValidateResponseEmailValidationResponsesItemDomain.self, forKey: .domain)
        self.account = try container.decode(BulkEmailValidateResponseEmailValidationResponsesItemAccount.self, forKey: .account)
        self.dns = try container.decode(BulkEmailValidateResponseEmailValidationResponsesItemDns.self, forKey: .dns)
        self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
        self.address = try container.decodeIfPresent(BulkEmailValidateResponseEmailValidationResponsesItemAddress.self, forKey: .address)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encode(self.validEmail, forKey: .validEmail)
        try container.encode(self.validSyntax, forKey: .validSyntax)
        try container.encode(self.domain, forKey: .domain)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.dns, forKey: .dns)
        try container.encodeIfPresent(self.ipAddress, forKey: .ipAddress)
        try container.encodeIfPresent(self.address, forKey: .address)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case email
        case name
        case reason
        case validEmail
        case validSyntax
        case domain
        case account
        case dns
        case ipAddress
        case address
    }
}