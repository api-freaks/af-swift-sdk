import Foundation

public struct DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContact: Codable, Hashable, Sendable {
    public let num: Int
    public let status: Bool
    public let domainName: String
    public let queryTime: Date
    public let whoisServer: String
    public let domainRegistered: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistered
    public let createDate: CalendarDate?
    public let updateDate: CalendarDate?
    public let expiryDate: CalendarDate?
    public let domainRegistrar: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistrar?
    public let resellerContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactResellerContact?
    public let registrantContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactRegistrantContact?
    public let administrativeContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactAdministrativeContact?
    public let technicalContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactTechnicalContact?
    public let billingContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactBillingContact?
    public let nameServers: [String]?
    public let domainStatus: [String]?
    public let whoisRawDomain: String?
    public let registryData: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactRegistryData?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        num: Int,
        status: Bool,
        domainName: String,
        queryTime: Date,
        whoisServer: String,
        domainRegistered: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistered,
        createDate: CalendarDate? = nil,
        updateDate: CalendarDate? = nil,
        expiryDate: CalendarDate? = nil,
        domainRegistrar: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistrar? = nil,
        resellerContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactResellerContact? = nil,
        registrantContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactRegistrantContact? = nil,
        administrativeContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactAdministrativeContact? = nil,
        technicalContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactTechnicalContact? = nil,
        billingContact: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactBillingContact? = nil,
        nameServers: [String]? = nil,
        domainStatus: [String]? = nil,
        whoisRawDomain: String? = nil,
        registryData: DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactRegistryData? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.num = num
        self.status = status
        self.domainName = domainName
        self.queryTime = queryTime
        self.whoisServer = whoisServer
        self.domainRegistered = domainRegistered
        self.createDate = createDate
        self.updateDate = updateDate
        self.expiryDate = expiryDate
        self.domainRegistrar = domainRegistrar
        self.resellerContact = resellerContact
        self.registrantContact = registrantContact
        self.administrativeContact = administrativeContact
        self.technicalContact = technicalContact
        self.billingContact = billingContact
        self.nameServers = nameServers
        self.domainStatus = domainStatus
        self.whoisRawDomain = whoisRawDomain
        self.registryData = registryData
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.num = try container.decode(Int.self, forKey: .num)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.queryTime = try container.decode(Date.self, forKey: .queryTime)
        self.whoisServer = try container.decode(String.self, forKey: .whoisServer)
        self.domainRegistered = try container.decode(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistered.self, forKey: .domainRegistered)
        self.createDate = try container.decodeIfPresent(CalendarDate.self, forKey: .createDate)
        self.updateDate = try container.decodeIfPresent(CalendarDate.self, forKey: .updateDate)
        self.expiryDate = try container.decodeIfPresent(CalendarDate.self, forKey: .expiryDate)
        self.domainRegistrar = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistrar.self, forKey: .domainRegistrar)
        self.resellerContact = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactResellerContact.self, forKey: .resellerContact)
        self.registrantContact = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactRegistrantContact.self, forKey: .registrantContact)
        self.administrativeContact = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactAdministrativeContact.self, forKey: .administrativeContact)
        self.technicalContact = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactTechnicalContact.self, forKey: .technicalContact)
        self.billingContact = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactBillingContact.self, forKey: .billingContact)
        self.nameServers = try container.decodeIfPresent([String].self, forKey: .nameServers)
        self.domainStatus = try container.decodeIfPresent([String].self, forKey: .domainStatus)
        self.whoisRawDomain = try container.decodeIfPresent(String.self, forKey: .whoisRawDomain)
        self.registryData = try container.decodeIfPresent(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactRegistryData.self, forKey: .registryData)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.num, forKey: .num)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encode(self.whoisServer, forKey: .whoisServer)
        try container.encode(self.domainRegistered, forKey: .domainRegistered)
        try container.encodeIfPresent(self.createDate, forKey: .createDate)
        try container.encodeIfPresent(self.updateDate, forKey: .updateDate)
        try container.encodeIfPresent(self.expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(self.domainRegistrar, forKey: .domainRegistrar)
        try container.encodeIfPresent(self.resellerContact, forKey: .resellerContact)
        try container.encodeIfPresent(self.registrantContact, forKey: .registrantContact)
        try container.encodeIfPresent(self.administrativeContact, forKey: .administrativeContact)
        try container.encodeIfPresent(self.technicalContact, forKey: .technicalContact)
        try container.encodeIfPresent(self.billingContact, forKey: .billingContact)
        try container.encodeIfPresent(self.nameServers, forKey: .nameServers)
        try container.encodeIfPresent(self.domainStatus, forKey: .domainStatus)
        try container.encodeIfPresent(self.whoisRawDomain, forKey: .whoisRawDomain)
        try container.encodeIfPresent(self.registryData, forKey: .registryData)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case num
        case status
        case domainName = "domain_name"
        case queryTime = "query_time"
        case whoisServer = "whois_server"
        case domainRegistered = "domain_registered"
        case createDate = "create_date"
        case updateDate = "update_date"
        case expiryDate = "expiry_date"
        case domainRegistrar = "domain_registrar"
        case resellerContact = "reseller_contact"
        case registrantContact = "registrant_contact"
        case administrativeContact = "administrative_contact"
        case technicalContact = "technical_contact"
        case billingContact = "billing_contact"
        case nameServers = "name_servers"
        case domainStatus = "domain_status"
        case whoisRawDomain = "whois_raw_domain"
        case registryData = "registry_data"
    }
}