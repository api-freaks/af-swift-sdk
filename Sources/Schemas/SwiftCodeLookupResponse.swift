import Foundation

public struct SwiftCodeLookupResponse: Codable, Hashable, Sendable {
    public let swiftCode: String
    public let countryCode: String
    public let bankAddress: String
    public let bankCode: String
    public let bankName: String
    public let city: String
    public let country: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        swiftCode: String,
        countryCode: String,
        bankAddress: String,
        bankCode: String,
        bankName: String,
        city: String,
        country: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.swiftCode = swiftCode
        self.countryCode = countryCode
        self.bankAddress = bankAddress
        self.bankCode = bankCode
        self.bankName = bankName
        self.city = city
        self.country = country
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.swiftCode = try container.decode(String.self, forKey: .swiftCode)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.bankAddress = try container.decode(String.self, forKey: .bankAddress)
        self.bankCode = try container.decode(String.self, forKey: .bankCode)
        self.bankName = try container.decode(String.self, forKey: .bankName)
        self.city = try container.decode(String.self, forKey: .city)
        self.country = try container.decode(String.self, forKey: .country)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.swiftCode, forKey: .swiftCode)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.bankAddress, forKey: .bankAddress)
        try container.encode(self.bankCode, forKey: .bankCode)
        try container.encode(self.bankName, forKey: .bankName)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case swiftCode
        case countryCode
        case bankAddress
        case bankCode
        case bankName
        case city
        case country
    }
}