import Foundation

public struct GetCountriesResponseCountriesItem: Codable, Hashable, Sendable {
    public let name: String
    public let isoAlpha2: String
    public let isoAlpha3: String
    public let isoNumeric: Int
    public let capital: String
    public let region: String
    public let subregion: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        isoAlpha2: String,
        isoAlpha3: String,
        isoNumeric: Int,
        capital: String,
        region: String,
        subregion: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.isoAlpha2 = isoAlpha2
        self.isoAlpha3 = isoAlpha3
        self.isoNumeric = isoNumeric
        self.capital = capital
        self.region = region
        self.subregion = subregion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.isoAlpha2 = try container.decode(String.self, forKey: .isoAlpha2)
        self.isoAlpha3 = try container.decode(String.self, forKey: .isoAlpha3)
        self.isoNumeric = try container.decode(Int.self, forKey: .isoNumeric)
        self.capital = try container.decode(String.self, forKey: .capital)
        self.region = try container.decode(String.self, forKey: .region)
        self.subregion = try container.decode(String.self, forKey: .subregion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isoAlpha2, forKey: .isoAlpha2)
        try container.encode(self.isoAlpha3, forKey: .isoAlpha3)
        try container.encode(self.isoNumeric, forKey: .isoNumeric)
        try container.encode(self.capital, forKey: .capital)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.subregion, forKey: .subregion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case isoAlpha2 = "iso_alpha_2"
        case isoAlpha3 = "iso_alpha_3"
        case isoNumeric = "iso_numeric"
        case capital
        case region
        case subregion
    }
}