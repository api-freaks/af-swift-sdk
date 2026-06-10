import Foundation

public struct BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdmin: Codable, Hashable, Sendable {
    public let name: String
    public let type: Int
    public let dnsType: BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdminDnsType
    public let ttl: Int
    public let rawText: String
    public let rRsetType: Int
    public let admin: String
    public let host: String
    public let expire: Int
    public let minimum: Int
    public let refresh: Int
    public let retry: Int
    public let serial: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: Int,
        dnsType: BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdminDnsType,
        ttl: Int,
        rawText: String,
        rRsetType: Int,
        admin: String,
        host: String,
        expire: Int,
        minimum: Int,
        refresh: Int,
        retry: Int,
        serial: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.dnsType = dnsType
        self.ttl = ttl
        self.rawText = rawText
        self.rRsetType = rRsetType
        self.admin = admin
        self.host = host
        self.expire = expire
        self.minimum = minimum
        self.refresh = refresh
        self.retry = retry
        self.serial = serial
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(Int.self, forKey: .type)
        self.dnsType = try container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdminDnsType.self, forKey: .dnsType)
        self.ttl = try container.decode(Int.self, forKey: .ttl)
        self.rawText = try container.decode(String.self, forKey: .rawText)
        self.rRsetType = try container.decode(Int.self, forKey: .rRsetType)
        self.admin = try container.decode(String.self, forKey: .admin)
        self.host = try container.decode(String.self, forKey: .host)
        self.expire = try container.decode(Int.self, forKey: .expire)
        self.minimum = try container.decode(Int.self, forKey: .minimum)
        self.refresh = try container.decode(Int.self, forKey: .refresh)
        self.retry = try container.decode(Int.self, forKey: .retry)
        self.serial = try container.decode(Int.self, forKey: .serial)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.dnsType, forKey: .dnsType)
        try container.encode(self.ttl, forKey: .ttl)
        try container.encode(self.rawText, forKey: .rawText)
        try container.encode(self.rRsetType, forKey: .rRsetType)
        try container.encode(self.admin, forKey: .admin)
        try container.encode(self.host, forKey: .host)
        try container.encode(self.expire, forKey: .expire)
        try container.encode(self.minimum, forKey: .minimum)
        try container.encode(self.refresh, forKey: .refresh)
        try container.encode(self.retry, forKey: .retry)
        try container.encode(self.serial, forKey: .serial)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case dnsType
        case ttl
        case rawText
        case rRsetType
        case admin
        case host
        case expire
        case minimum
        case refresh
        case retry
        case serial
    }
}