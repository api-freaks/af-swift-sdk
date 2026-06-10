import Foundation

public struct GetCountriesResponse: Codable, Hashable, Sendable {
    public let countries: [GetCountriesResponseCountriesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        countries: [GetCountriesResponseCountriesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.countries = countries
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countries = try container.decode([GetCountriesResponseCountriesItem].self, forKey: .countries)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.countries, forKey: .countries)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case countries
    }
}