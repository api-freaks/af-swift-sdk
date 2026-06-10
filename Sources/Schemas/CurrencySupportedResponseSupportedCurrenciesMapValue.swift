import Foundation

public struct CurrencySupportedResponseSupportedCurrenciesMapValue: Codable, Hashable, Sendable {
    public let currencyCode: String
    public let currencyName: String
    public let countryCode: String
    public let countryName: String
    public let status: CurrencySupportedResponseSupportedCurrenciesMapValueStatus
    public let availableFrom: String
    public let availableUntil: String
    public let icon: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currencyCode: String,
        currencyName: String,
        countryCode: String,
        countryName: String,
        status: CurrencySupportedResponseSupportedCurrenciesMapValueStatus,
        availableFrom: String,
        availableUntil: String,
        icon: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currencyCode = currencyCode
        self.currencyName = currencyName
        self.countryCode = countryCode
        self.countryName = countryName
        self.status = status
        self.availableFrom = availableFrom
        self.availableUntil = availableUntil
        self.icon = icon
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currencyCode = try container.decode(String.self, forKey: .currencyCode)
        self.currencyName = try container.decode(String.self, forKey: .currencyName)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.status = try container.decode(CurrencySupportedResponseSupportedCurrenciesMapValueStatus.self, forKey: .status)
        self.availableFrom = try container.decode(String.self, forKey: .availableFrom)
        self.availableUntil = try container.decode(String.self, forKey: .availableUntil)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currencyCode, forKey: .currencyCode)
        try container.encode(self.currencyName, forKey: .currencyName)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.availableFrom, forKey: .availableFrom)
        try container.encode(self.availableUntil, forKey: .availableUntil)
        try container.encode(self.icon, forKey: .icon)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currencyCode
        case currencyName
        case countryCode
        case countryName
        case status
        case availableFrom
        case availableUntil
        case icon
    }
}