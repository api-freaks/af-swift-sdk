import Foundation

public struct CommodityTimeSeriesResponseMetadataValue: Codable, Hashable, Sendable {
    /// Unit of the respective commodity.
    public let unit: String
    /// Quote currency of the respective commodity.
    public let quote: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        unit: String,
        quote: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.unit = unit
        self.quote = quote
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.unit = try container.decode(String.self, forKey: .unit)
        self.quote = try container.decode(String.self, forKey: .quote)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.unit, forKey: .unit)
        try container.encode(self.quote, forKey: .quote)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case unit
        case quote
    }
}