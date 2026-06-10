import Foundation

public struct CommoditySymbolsResponseSymbolsItemUnit: Codable, Hashable, Sendable {
    /// The abbreviated unit symbol (e.g., "T.oz", "MMBtu").
    public let symbol: String
    /// The full name of the unit of measurement.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        symbol: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.symbol = symbol
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.symbol, forKey: .symbol)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case symbol
        case name
    }
}