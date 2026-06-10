import Foundation

public struct DomainSslChainLookupResponseSslCertificatesItemIssuer: Codable, Hashable, Sendable {
    public let commonName: String
    public let organization: String?
    public let organizationalUnit: String?
    public let locality: String?
    public let state: String?
    public let country: String?
    public let incCountry: String?
    public let incState: String?
    public let businessCategory: String?
    public let street: String?
    public let postalCode: String?
    public let serialNumber: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        commonName: String,
        organization: String? = nil,
        organizationalUnit: String? = nil,
        locality: String? = nil,
        state: String? = nil,
        country: String? = nil,
        incCountry: String? = nil,
        incState: String? = nil,
        businessCategory: String? = nil,
        street: String? = nil,
        postalCode: String? = nil,
        serialNumber: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.commonName = commonName
        self.organization = organization
        self.organizationalUnit = organizationalUnit
        self.locality = locality
        self.state = state
        self.country = country
        self.incCountry = incCountry
        self.incState = incState
        self.businessCategory = businessCategory
        self.street = street
        self.postalCode = postalCode
        self.serialNumber = serialNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.commonName = try container.decode(String.self, forKey: .commonName)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.organizationalUnit = try container.decodeIfPresent(String.self, forKey: .organizationalUnit)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.incCountry = try container.decodeIfPresent(String.self, forKey: .incCountry)
        self.incState = try container.decodeIfPresent(String.self, forKey: .incState)
        self.businessCategory = try container.decodeIfPresent(String.self, forKey: .businessCategory)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        self.serialNumber = try container.decodeIfPresent(String.self, forKey: .serialNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.commonName, forKey: .commonName)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.organizationalUnit, forKey: .organizationalUnit)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.incCountry, forKey: .incCountry)
        try container.encodeIfPresent(self.incState, forKey: .incState)
        try container.encodeIfPresent(self.businessCategory, forKey: .businessCategory)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeIfPresent(self.serialNumber, forKey: .serialNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case commonName
        case organization
        case organizationalUnit
        case locality
        case state
        case country
        case incCountry
        case incState
        case businessCategory
        case street
        case postalCode
        case serialNumber
    }
}