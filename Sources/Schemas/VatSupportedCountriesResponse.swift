import Foundation

public struct VatSupportedCountriesResponse: Codable, Hashable, Sendable {
    public let vatSupportedCountriesAndStates: [[String: VatSupportedCountriesResponseVatSupportedCountriesAndStatesItemValue]]?
    /// Array of countries supported by the IBAN Validation API.
    public let ibanSupportedCountries: [VatSupportedCountriesResponseIbanSupportedCountriesItem]?
    /// Array of countries supported by the SWIFT/BIC Code Lookup and Finder APIs.
    public let swiftSupportedCountries: [VatSupportedCountriesResponseSwiftSupportedCountriesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        vatSupportedCountriesAndStates: [[String: VatSupportedCountriesResponseVatSupportedCountriesAndStatesItemValue]]? = nil,
        ibanSupportedCountries: [VatSupportedCountriesResponseIbanSupportedCountriesItem]? = nil,
        swiftSupportedCountries: [VatSupportedCountriesResponseSwiftSupportedCountriesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.vatSupportedCountriesAndStates = vatSupportedCountriesAndStates
        self.ibanSupportedCountries = ibanSupportedCountries
        self.swiftSupportedCountries = swiftSupportedCountries
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vatSupportedCountriesAndStates = try container.decodeIfPresent([[String: VatSupportedCountriesResponseVatSupportedCountriesAndStatesItemValue]].self, forKey: .vatSupportedCountriesAndStates)
        self.ibanSupportedCountries = try container.decodeIfPresent([VatSupportedCountriesResponseIbanSupportedCountriesItem].self, forKey: .ibanSupportedCountries)
        self.swiftSupportedCountries = try container.decodeIfPresent([VatSupportedCountriesResponseSwiftSupportedCountriesItem].self, forKey: .swiftSupportedCountries)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.vatSupportedCountriesAndStates, forKey: .vatSupportedCountriesAndStates)
        try container.encodeIfPresent(self.ibanSupportedCountries, forKey: .ibanSupportedCountries)
        try container.encodeIfPresent(self.swiftSupportedCountries, forKey: .swiftSupportedCountries)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case vatSupportedCountriesAndStates = "VAT_Supported_Countries_And_States"
        case ibanSupportedCountries = "IBAN_Supported_Countries"
        case swiftSupportedCountries = "SWIFT_Supported_Countries"
    }
}