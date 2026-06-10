import Foundation

public struct CommoditySymbolsResponse: Codable, Hashable, Sendable {
    /// Indicates whether the API request was successful.
    public let success: Bool
    /// An array of commodity symbol objects.
    public let symbols: [CommoditySymbolsResponseSymbolsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        symbols: [CommoditySymbolsResponseSymbolsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.symbols = symbols
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.symbols = try container.decode([CommoditySymbolsResponseSymbolsItem].self, forKey: .symbols)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.symbols, forKey: .symbols)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case symbols
    }
}