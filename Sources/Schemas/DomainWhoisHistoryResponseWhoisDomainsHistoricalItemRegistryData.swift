import Foundation

public struct DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryData: Codable, Hashable, Sendable {
    public let domainName: String?
    public let queryTime: Date?
    public let whoisServer: String?
    public let domainRegistered: DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryDataDomainRegistered?
    public let createDate: CalendarDate?
    public let updateDate: CalendarDate?
    public let expiryDate: CalendarDate?
    public let nameServers: [String]?
    public let domainStatus: [String]?
    public let whoisRawRegistry: String?
    public let domainRegistrar: DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryDataDomainRegistrar?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainName: String? = nil,
        queryTime: Date? = nil,
        whoisServer: String? = nil,
        domainRegistered: DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryDataDomainRegistered? = nil,
        createDate: CalendarDate? = nil,
        updateDate: CalendarDate? = nil,
        expiryDate: CalendarDate? = nil,
        nameServers: [String]? = nil,
        domainStatus: [String]? = nil,
        whoisRawRegistry: String? = nil,
        domainRegistrar: DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryDataDomainRegistrar? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainName = domainName
        self.queryTime = queryTime
        self.whoisServer = whoisServer
        self.domainRegistered = domainRegistered
        self.createDate = createDate
        self.updateDate = updateDate
        self.expiryDate = expiryDate
        self.nameServers = nameServers
        self.domainStatus = domainStatus
        self.whoisRawRegistry = whoisRawRegistry
        self.domainRegistrar = domainRegistrar
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainName = try container.decodeIfPresent(String.self, forKey: .domainName)
        self.queryTime = try container.decodeIfPresent(Date.self, forKey: .queryTime)
        self.whoisServer = try container.decodeIfPresent(String.self, forKey: .whoisServer)
        self.domainRegistered = try container.decodeIfPresent(DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryDataDomainRegistered.self, forKey: .domainRegistered)
        self.createDate = try container.decodeIfPresent(CalendarDate.self, forKey: .createDate)
        self.updateDate = try container.decodeIfPresent(CalendarDate.self, forKey: .updateDate)
        self.expiryDate = try container.decodeIfPresent(CalendarDate.self, forKey: .expiryDate)
        self.nameServers = try container.decodeIfPresent([String].self, forKey: .nameServers)
        self.domainStatus = try container.decodeIfPresent([String].self, forKey: .domainStatus)
        self.whoisRawRegistry = try container.decodeIfPresent(String.self, forKey: .whoisRawRegistry)
        self.domainRegistrar = try container.decodeIfPresent(DomainWhoisHistoryResponseWhoisDomainsHistoricalItemRegistryDataDomainRegistrar.self, forKey: .domainRegistrar)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domainName, forKey: .domainName)
        try container.encodeIfPresent(self.queryTime, forKey: .queryTime)
        try container.encodeIfPresent(self.whoisServer, forKey: .whoisServer)
        try container.encodeIfPresent(self.domainRegistered, forKey: .domainRegistered)
        try container.encodeIfPresent(self.createDate, forKey: .createDate)
        try container.encodeIfPresent(self.updateDate, forKey: .updateDate)
        try container.encodeIfPresent(self.expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(self.nameServers, forKey: .nameServers)
        try container.encodeIfPresent(self.domainStatus, forKey: .domainStatus)
        try container.encodeIfPresent(self.whoisRawRegistry, forKey: .whoisRawRegistry)
        try container.encodeIfPresent(self.domainRegistrar, forKey: .domainRegistrar)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainName = "domain_name"
        case queryTime = "query_time"
        case whoisServer = "whois_server"
        case domainRegistered = "domain_registered"
        case createDate = "create_date"
        case updateDate = "update_date"
        case expiryDate = "expiry_date"
        case nameServers = "name_servers"
        case domainStatus = "domain_status"
        case whoisRawRegistry = "whois_raw_registry"
        case domainRegistrar = "domain_registrar"
    }
}