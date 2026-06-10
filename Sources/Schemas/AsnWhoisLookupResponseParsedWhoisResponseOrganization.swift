import Foundation

public struct AsnWhoisLookupResponseParsedWhoisResponseOrganization: Codable, Hashable, Sendable {
    public let handle: String?
    public let name: String?
    public let address: [String]?
    public let street: String?
    public let city: String?
    public let state: String?
    public let zipCode: String?
    public let country: [String]?
    public let addressCountry: String?
    public let dateCreated: CalendarDate?
    public let dateUpdated: CalendarDate?
    public let source: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String? = nil,
        name: String? = nil,
        address: [String]? = nil,
        street: String? = nil,
        city: String? = nil,
        state: String? = nil,
        zipCode: String? = nil,
        country: [String]? = nil,
        addressCountry: String? = nil,
        dateCreated: CalendarDate? = nil,
        dateUpdated: CalendarDate? = nil,
        source: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.handle = handle
        self.name = name
        self.address = address
        self.street = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.country = country
        self.addressCountry = addressCountry
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.address = try container.decodeIfPresent([String].self, forKey: .address)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
        self.country = try container.decodeIfPresent([String].self, forKey: .country)
        self.addressCountry = try container.decodeIfPresent(String.self, forKey: .addressCountry)
        self.dateCreated = try container.decodeIfPresent(CalendarDate.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeIfPresent(CalendarDate.self, forKey: .dateUpdated)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.handle, forKey: .handle)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zipCode, forKey: .zipCode)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.addressCountry, forKey: .addressCountry)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encodeIfPresent(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case handle
        case name
        case address
        case street
        case city
        case state
        case zipCode = "zip_code"
        case country
        case addressCountry
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
    }
}