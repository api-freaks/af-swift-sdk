import Foundation

/// Current WHOIS registration record for one successfully resolved domain.
public struct BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContact: Codable, Hashable, Sendable {
    /// true if this item was successfully processed.
    public let status: Bool
    /// Domain name that was queried.
    public let domainName: String
    /// Timestamp when the WHOIS query was executed.
    public let queryTime: String
    /// WHOIS or RDAP server that provided this record.
    public let whoisServer: String
    /// Domain registration status; 'restricted' means the registry withholds registration details.
    public let domainRegistered: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistered
    /// Indicates if DNSSEC or secure DNS is enabled for the domain.
    public let secureDns: Bool?
    /// Internal domain registry handle/ID.
    public let domainHandle: String?
    /// Date the domain was originally registered, when the domain is registered.
    public let createDate: CalendarDate?
    /// Date the domain registration was last updated, when the domain is registered.
    public let updateDate: CalendarDate?
    /// Date the domain registration is set to expire, when the domain is registered.
    public let expiryDate: CalendarDate?
    /// Registrar of record for a domain, as published by either the registrar or the registry.
    public let domainRegistrar: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistrar?
    /// A contact record (registrant, administrative, technical, billing, or reseller) published in the domain's WHOIS record.
    public let resellerContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactResellerContact?
    /// A contact record (registrant, administrative, technical, billing, or reseller) published in the domain's WHOIS record.
    public let registrantContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistrantContact?
    /// A contact record (registrant, administrative, technical, billing, or reseller) published in the domain's WHOIS record.
    public let administrativeContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactAdministrativeContact?
    /// A contact record (registrant, administrative, technical, billing, or reseller) published in the domain's WHOIS record.
    public let technicalContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactTechnicalContact?
    /// A contact record (registrant, administrative, technical, billing, or reseller) published in the domain's WHOIS record.
    public let billingContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactBillingContact?
    /// Registrar's abuse-reporting contact.
    public let abuseContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactAbuseContact?
    /// Domain eligibility information (populated for TLDs with registrant eligibility requirements, e.g. .eu).
    public let eligibilityInfo: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactEligibilityInfo?
    /// Name servers currently recorded for the domain.
    public let nameServers: [String]?
    /// EPP domain status codes currently recorded for the domain.
    public let domainStatus: [String]?
    /// Raw WHOIS text as returned by the registrar's WHOIS server.
    public let whoisRawDomain: String?
    /// Registry-level (as opposed to registrar-level) WHOIS data, sourced directly from the TLD registry.
    public let registryData: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryData?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        domainName: String,
        queryTime: String,
        whoisServer: String,
        domainRegistered: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistered,
        secureDns: Bool? = nil,
        domainHandle: String? = nil,
        createDate: CalendarDate? = nil,
        updateDate: CalendarDate? = nil,
        expiryDate: CalendarDate? = nil,
        domainRegistrar: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistrar? = nil,
        resellerContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactResellerContact? = nil,
        registrantContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistrantContact? = nil,
        administrativeContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactAdministrativeContact? = nil,
        technicalContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactTechnicalContact? = nil,
        billingContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactBillingContact? = nil,
        abuseContact: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactAbuseContact? = nil,
        eligibilityInfo: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactEligibilityInfo? = nil,
        nameServers: [String]? = nil,
        domainStatus: [String]? = nil,
        whoisRawDomain: String? = nil,
        registryData: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryData? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.domainName = domainName
        self.queryTime = queryTime
        self.whoisServer = whoisServer
        self.domainRegistered = domainRegistered
        self.secureDns = secureDns
        self.domainHandle = domainHandle
        self.createDate = createDate
        self.updateDate = updateDate
        self.expiryDate = expiryDate
        self.domainRegistrar = domainRegistrar
        self.resellerContact = resellerContact
        self.registrantContact = registrantContact
        self.administrativeContact = administrativeContact
        self.technicalContact = technicalContact
        self.billingContact = billingContact
        self.abuseContact = abuseContact
        self.eligibilityInfo = eligibilityInfo
        self.nameServers = nameServers
        self.domainStatus = domainStatus
        self.whoisRawDomain = whoisRawDomain
        self.registryData = registryData
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.queryTime = try container.decode(String.self, forKey: .queryTime)
        self.whoisServer = try container.decode(String.self, forKey: .whoisServer)
        self.domainRegistered = try container.decode(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistered.self, forKey: .domainRegistered)
        self.secureDns = try container.decodeIfPresent(Bool.self, forKey: .secureDns)
        self.domainHandle = try container.decodeIfPresent(String.self, forKey: .domainHandle)
        self.createDate = try container.decodeIfPresent(CalendarDate.self, forKey: .createDate)
        self.updateDate = try container.decodeIfPresent(CalendarDate.self, forKey: .updateDate)
        self.expiryDate = try container.decodeIfPresent(CalendarDate.self, forKey: .expiryDate)
        self.domainRegistrar = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistrar.self, forKey: .domainRegistrar)
        self.resellerContact = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactResellerContact.self, forKey: .resellerContact)
        self.registrantContact = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistrantContact.self, forKey: .registrantContact)
        self.administrativeContact = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactAdministrativeContact.self, forKey: .administrativeContact)
        self.technicalContact = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactTechnicalContact.self, forKey: .technicalContact)
        self.billingContact = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactBillingContact.self, forKey: .billingContact)
        self.abuseContact = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactAbuseContact.self, forKey: .abuseContact)
        self.eligibilityInfo = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactEligibilityInfo.self, forKey: .eligibilityInfo)
        self.nameServers = try container.decodeIfPresent([String].self, forKey: .nameServers)
        self.domainStatus = try container.decodeIfPresent([String].self, forKey: .domainStatus)
        self.whoisRawDomain = try container.decodeIfPresent(String.self, forKey: .whoisRawDomain)
        self.registryData = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryData.self, forKey: .registryData)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encode(self.whoisServer, forKey: .whoisServer)
        try container.encode(self.domainRegistered, forKey: .domainRegistered)
        try container.encodeIfPresent(self.secureDns, forKey: .secureDns)
        try container.encodeIfPresent(self.domainHandle, forKey: .domainHandle)
        try container.encodeIfPresent(self.createDate, forKey: .createDate)
        try container.encodeIfPresent(self.updateDate, forKey: .updateDate)
        try container.encodeIfPresent(self.expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(self.domainRegistrar, forKey: .domainRegistrar)
        try container.encodeIfPresent(self.resellerContact, forKey: .resellerContact)
        try container.encodeIfPresent(self.registrantContact, forKey: .registrantContact)
        try container.encodeIfPresent(self.administrativeContact, forKey: .administrativeContact)
        try container.encodeIfPresent(self.technicalContact, forKey: .technicalContact)
        try container.encodeIfPresent(self.billingContact, forKey: .billingContact)
        try container.encodeIfPresent(self.abuseContact, forKey: .abuseContact)
        try container.encodeIfPresent(self.eligibilityInfo, forKey: .eligibilityInfo)
        try container.encodeIfPresent(self.nameServers, forKey: .nameServers)
        try container.encodeIfPresent(self.domainStatus, forKey: .domainStatus)
        try container.encodeIfPresent(self.whoisRawDomain, forKey: .whoisRawDomain)
        try container.encodeIfPresent(self.registryData, forKey: .registryData)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case domainName = "domain_name"
        case queryTime = "query_time"
        case whoisServer = "whois_server"
        case domainRegistered = "domain_registered"
        case secureDns = "secure_dns"
        case domainHandle = "domain_handle"
        case createDate = "create_date"
        case updateDate = "update_date"
        case expiryDate = "expiry_date"
        case domainRegistrar = "domain_registrar"
        case resellerContact = "reseller_contact"
        case registrantContact = "registrant_contact"
        case administrativeContact = "administrative_contact"
        case technicalContact = "technical_contact"
        case billingContact = "billing_contact"
        case abuseContact = "abuse_contact"
        case eligibilityInfo = "eligibility_info"
        case nameServers = "name_servers"
        case domainStatus = "domain_status"
        case whoisRawDomain = "whois_raw_domain"
        case registryData = "registry_data"
    }
}