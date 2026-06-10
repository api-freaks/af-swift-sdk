import Foundation

public struct VatSupportedCountriesResponse: Codable, Hashable, Sendable {
    public let vatSupportedCountriesAndStates: [VatSupportedCountriesResponseVatSupportedCountriesAndStatesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        vatSupportedCountriesAndStates: [VatSupportedCountriesResponseVatSupportedCountriesAndStatesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.vatSupportedCountriesAndStates = vatSupportedCountriesAndStates
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.vatSupportedCountriesAndStates = try container.decodeIfPresent([VatSupportedCountriesResponseVatSupportedCountriesAndStatesItem].self, forKey: .vatSupportedCountriesAndStates)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.vatSupportedCountriesAndStates, forKey: .vatSupportedCountriesAndStates)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case vatSupportedCountriesAndStates = "VAT_Supported_Countries_And_States"
    }
}