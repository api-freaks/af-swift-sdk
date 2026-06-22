import Foundation

public struct DomainWhoisReverseResponseWhoisDomainsHistoricalItemCompanyname: Codable, Hashable, Sendable {
    public let num: Int
    public let domainName: String
    public let createDate: CalendarDate?
    public let updateDate: CalendarDate?
    public let expiryDate: CalendarDate?
    public let name: String?
    public let email: String?
    public let companyName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        num: Int,
        domainName: String,
        createDate: CalendarDate? = nil,
        updateDate: CalendarDate? = nil,
        expiryDate: CalendarDate? = nil,
        name: String? = nil,
        email: String? = nil,
        companyName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.num = num
        self.domainName = domainName
        self.createDate = createDate
        self.updateDate = updateDate
        self.expiryDate = expiryDate
        self.name = name
        self.email = email
        self.companyName = companyName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.num = try container.decode(Int.self, forKey: .num)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.createDate = try container.decodeIfPresent(CalendarDate.self, forKey: .createDate)
        self.updateDate = try container.decodeIfPresent(CalendarDate.self, forKey: .updateDate)
        self.expiryDate = try container.decodeIfPresent(CalendarDate.self, forKey: .expiryDate)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.num, forKey: .num)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encodeIfPresent(self.createDate, forKey: .createDate)
        try container.encodeIfPresent(self.updateDate, forKey: .updateDate)
        try container.encodeIfPresent(self.expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.companyName, forKey: .companyName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case num
        case domainName = "domain_name"
        case createDate = "create_date"
        case updateDate = "update_date"
        case expiryDate = "expiry_date"
        case name
        case email
        case companyName = "company_name"
    }
}