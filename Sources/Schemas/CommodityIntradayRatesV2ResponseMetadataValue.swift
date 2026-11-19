import Foundation

/// Unit and currency of the prices for one commodity.
public struct CommodityIntradayRatesV2ResponseMetadataValue: Codable, Hashable, Sendable {
    /// Unit the commodity is priced in (for example `T.oz` or `Bbl`).
    public let unit: String?
    /// Currency the prices are quoted in (for example `USD`).
    public let quote: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        unit: String? = nil,
        quote: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.unit = unit
        self.quote = quote
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.unit = try container.decodeIfPresent(String.self, forKey: .unit)
        self.quote = try container.decodeIfPresent(String.self, forKey: .quote)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.unit, forKey: .unit)
        try container.encodeIfPresent(self.quote, forKey: .quote)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case unit
        case quote
    }
}