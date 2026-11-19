import Foundation

/// Disposable email check response.
public struct DisposableEmailCheckV2Response: Codable, Hashable, Sendable {
    /// The email address submitted for the check.
    public let email: String
    /// Validates email address format compliance with RFC 5322 standards. When false, domain only contains name/validDomain and account/dns are omitted entirely.
    public let validSyntax: Bool
    /// Domain-level disposable/spam/free classification for the email address.
    public let domain: DisposableEmailCheckV2ResponseDomain
    /// Account-level detection details. Omitted entirely when validSyntax is false.
    public let account: DisposableEmailCheckV2ResponseAccount?
    /// DNS records for the email domain. Omitted entirely when validSyntax is false or the domain does not exist (NXDOMAIN).
    public let dns: DisposableEmailCheckV2ResponseDns?
    /// The IP address that was looked up.
    public let ip: String?
    /// Geolocation and security enrichment data for the IP address.
    public let address: DisposableEmailCheckV2ResponseAddress?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: String,
        validSyntax: Bool,
        domain: DisposableEmailCheckV2ResponseDomain,
        account: DisposableEmailCheckV2ResponseAccount? = nil,
        dns: DisposableEmailCheckV2ResponseDns? = nil,
        ip: String? = nil,
        address: DisposableEmailCheckV2ResponseAddress? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.validSyntax = validSyntax
        self.domain = domain
        self.account = account
        self.dns = dns
        self.ip = ip
        self.address = address
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.validSyntax = try container.decode(Bool.self, forKey: .validSyntax)
        self.domain = try container.decode(DisposableEmailCheckV2ResponseDomain.self, forKey: .domain)
        self.account = try container.decodeIfPresent(DisposableEmailCheckV2ResponseAccount.self, forKey: .account)
        self.dns = try container.decodeIfPresent(DisposableEmailCheckV2ResponseDns.self, forKey: .dns)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.address = try container.decodeIfPresent(DisposableEmailCheckV2ResponseAddress.self, forKey: .address)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.validSyntax, forKey: .validSyntax)
        try container.encode(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.account, forKey: .account)
        try container.encodeIfPresent(self.dns, forKey: .dns)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.address, forKey: .address)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case validSyntax
        case domain
        case account
        case dns
        case ip
        case address
    }
}