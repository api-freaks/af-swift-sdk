import Foundation

public struct AsnWhoisLookupResponseParsedWhoisResponse: Codable, Hashable, Sendable {
    public let status: Bool
    public let whoisServer: String
    public let autNums: [AsnWhoisLookupResponseParsedWhoisResponseAutNumsItem]
    public let organization: AsnWhoisLookupResponseParsedWhoisResponseOrganization
    public let technicalContacts: [AsnWhoisLookupResponseParsedWhoisResponseTechnicalContactsItem]
    public let abuseContacts: [AsnWhoisLookupResponseParsedWhoisResponseAbuseContactsItem]
    /// Timestamp when the WHOIS query was executed, in `YYYY-MM-DD HH:mm:ss` format — not ISO 8601 (no `T` separator, no milliseconds, no `Z`).
    public let queryTime: String?
    /// Raw referral WHOIS (rwhois) text, when the registry delegates to a referral server.
    public let rWhoisRawResponse: String?
    /// Unparsed raw WHOIS text, when returned separately from whoisResponse.
    public let whoisRawResponse: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        whoisServer: String,
        autNums: [AsnWhoisLookupResponseParsedWhoisResponseAutNumsItem],
        organization: AsnWhoisLookupResponseParsedWhoisResponseOrganization,
        technicalContacts: [AsnWhoisLookupResponseParsedWhoisResponseTechnicalContactsItem],
        abuseContacts: [AsnWhoisLookupResponseParsedWhoisResponseAbuseContactsItem],
        queryTime: String? = nil,
        rWhoisRawResponse: String? = nil,
        whoisRawResponse: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.whoisServer = whoisServer
        self.autNums = autNums
        self.organization = organization
        self.technicalContacts = technicalContacts
        self.abuseContacts = abuseContacts
        self.queryTime = queryTime
        self.rWhoisRawResponse = rWhoisRawResponse
        self.whoisRawResponse = whoisRawResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.whoisServer = try container.decode(String.self, forKey: .whoisServer)
        self.autNums = try container.decode([AsnWhoisLookupResponseParsedWhoisResponseAutNumsItem].self, forKey: .autNums)
        self.organization = try container.decode(AsnWhoisLookupResponseParsedWhoisResponseOrganization.self, forKey: .organization)
        self.technicalContacts = try container.decode([AsnWhoisLookupResponseParsedWhoisResponseTechnicalContactsItem].self, forKey: .technicalContacts)
        self.abuseContacts = try container.decode([AsnWhoisLookupResponseParsedWhoisResponseAbuseContactsItem].self, forKey: .abuseContacts)
        self.queryTime = try container.decodeIfPresent(String.self, forKey: .queryTime)
        self.rWhoisRawResponse = try container.decodeIfPresent(String.self, forKey: .rWhoisRawResponse)
        self.whoisRawResponse = try container.decodeIfPresent(String.self, forKey: .whoisRawResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.whoisServer, forKey: .whoisServer)
        try container.encode(self.autNums, forKey: .autNums)
        try container.encode(self.organization, forKey: .organization)
        try container.encode(self.technicalContacts, forKey: .technicalContacts)
        try container.encode(self.abuseContacts, forKey: .abuseContacts)
        try container.encodeIfPresent(self.queryTime, forKey: .queryTime)
        try container.encodeIfPresent(self.rWhoisRawResponse, forKey: .rWhoisRawResponse)
        try container.encodeIfPresent(self.whoisRawResponse, forKey: .whoisRawResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case whoisServer = "whois_server"
        case autNums = "aut_nums"
        case organization
        case technicalContacts = "technical_contacts"
        case abuseContacts = "abuse_contacts"
        case queryTime = "query_time"
        case rWhoisRawResponse = "r_whois_raw_response"
        case whoisRawResponse = "whois_raw_response"
    }
}