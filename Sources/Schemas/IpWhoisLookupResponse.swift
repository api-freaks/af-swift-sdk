import Foundation

public struct IpWhoisLookupResponse: Codable, Hashable, Sendable {
    public let status: Bool?
    public let ipAddress: String?
    public let queryTime: String?
    public let whoisServer: String?
    public let inetNums: [IpWhoisLookupResponseInetNumsItem]?
    public let irt: IpWhoisLookupResponseIrt?
    public let organization: IpWhoisLookupResponseOrganization?
    public let technicalContacts: [IpWhoisLookupResponseTechnicalContactsItem]?
    public let abuseContacts: [IpWhoisLookupResponseAbuseContactsItem]?
    public let administrativeContacts: [IpWhoisLookupResponseAdministrativeContactsItem]?
    public let whoisRawResponse: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool? = nil,
        ipAddress: String? = nil,
        queryTime: String? = nil,
        whoisServer: String? = nil,
        inetNums: [IpWhoisLookupResponseInetNumsItem]? = nil,
        irt: IpWhoisLookupResponseIrt? = nil,
        organization: IpWhoisLookupResponseOrganization? = nil,
        technicalContacts: [IpWhoisLookupResponseTechnicalContactsItem]? = nil,
        abuseContacts: [IpWhoisLookupResponseAbuseContactsItem]? = nil,
        administrativeContacts: [IpWhoisLookupResponseAdministrativeContactsItem]? = nil,
        whoisRawResponse: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.ipAddress = ipAddress
        self.queryTime = queryTime
        self.whoisServer = whoisServer
        self.inetNums = inetNums
        self.irt = irt
        self.organization = organization
        self.technicalContacts = technicalContacts
        self.abuseContacts = abuseContacts
        self.administrativeContacts = administrativeContacts
        self.whoisRawResponse = whoisRawResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Bool.self, forKey: .status)
        self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
        self.queryTime = try container.decodeIfPresent(String.self, forKey: .queryTime)
        self.whoisServer = try container.decodeIfPresent(String.self, forKey: .whoisServer)
        self.inetNums = try container.decodeIfPresent([IpWhoisLookupResponseInetNumsItem].self, forKey: .inetNums)
        self.irt = try container.decodeIfPresent(IpWhoisLookupResponseIrt.self, forKey: .irt)
        self.organization = try container.decodeIfPresent(IpWhoisLookupResponseOrganization.self, forKey: .organization)
        self.technicalContacts = try container.decodeIfPresent([IpWhoisLookupResponseTechnicalContactsItem].self, forKey: .technicalContacts)
        self.abuseContacts = try container.decodeIfPresent([IpWhoisLookupResponseAbuseContactsItem].self, forKey: .abuseContacts)
        self.administrativeContacts = try container.decodeIfPresent([IpWhoisLookupResponseAdministrativeContactsItem].self, forKey: .administrativeContacts)
        self.whoisRawResponse = try container.decodeIfPresent(String.self, forKey: .whoisRawResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.ipAddress, forKey: .ipAddress)
        try container.encodeIfPresent(self.queryTime, forKey: .queryTime)
        try container.encodeIfPresent(self.whoisServer, forKey: .whoisServer)
        try container.encodeIfPresent(self.inetNums, forKey: .inetNums)
        try container.encodeIfPresent(self.irt, forKey: .irt)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.technicalContacts, forKey: .technicalContacts)
        try container.encodeIfPresent(self.abuseContacts, forKey: .abuseContacts)
        try container.encodeIfPresent(self.administrativeContacts, forKey: .administrativeContacts)
        try container.encodeIfPresent(self.whoisRawResponse, forKey: .whoisRawResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case ipAddress = "ip_address"
        case queryTime = "query_time"
        case whoisServer = "whois_server"
        case inetNums = "inet_nums"
        case irt
        case organization
        case technicalContacts = "technical_contacts"
        case abuseContacts = "abuse_contacts"
        case administrativeContacts = "administrative_contacts"
        case whoisRawResponse = "whois_raw_response"
    }
}