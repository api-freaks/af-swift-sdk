import Foundation

public struct DomainWhoisLookupResponseBillingContact: Codable, Hashable, Sendable {
    public let name: String?
    public let company: String?
    public let street: String?
    public let city: String?
    public let state: String?
    public let zipCode: String?
    public let countryName: String?
    public let countryCode: String?
    public let emailAddress: String?
    public let phone: String?
    public let fax: String?
    public let mailingAddress: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        company: String? = nil,
        street: String? = nil,
        city: String? = nil,
        state: String? = nil,
        zipCode: String? = nil,
        countryName: String? = nil,
        countryCode: String? = nil,
        emailAddress: String? = nil,
        phone: String? = nil,
        fax: String? = nil,
        mailingAddress: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.company = company
        self.street = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.countryName = countryName
        self.countryCode = countryCode
        self.emailAddress = emailAddress
        self.phone = phone
        self.fax = fax
        self.mailingAddress = mailingAddress
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.company = try container.decodeIfPresent(String.self, forKey: .company)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.fax = try container.decodeIfPresent(String.self, forKey: .fax)
        self.mailingAddress = try container.decodeIfPresent(String.self, forKey: .mailingAddress)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.company, forKey: .company)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zipCode, forKey: .zipCode)
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
        try container.encodeIfPresent(self.emailAddress, forKey: .emailAddress)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.fax, forKey: .fax)
        try container.encodeIfPresent(self.mailingAddress, forKey: .mailingAddress)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case company
        case street
        case city
        case state
        case zipCode = "zip_code"
        case countryName = "country_name"
        case countryCode = "country_code"
        case emailAddress = "email_address"
        case phone
        case fax
        case mailingAddress = "mailing_address"
    }
}