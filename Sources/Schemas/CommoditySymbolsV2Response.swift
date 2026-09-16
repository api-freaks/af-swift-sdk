import Foundation

public struct CommoditySymbolsV2Response: Codable, Hashable, Sendable {
    /// API request success indicator. "true" for successful requests.
    public let success: Bool
    /// An array of commodity symbol objects.
    public let symbols: [CommoditySymbolsV2ResponseSymbolsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        symbols: [CommoditySymbolsV2ResponseSymbolsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.symbols = symbols
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.symbols = try container.decode([CommoditySymbolsV2ResponseSymbolsItem].self, forKey: .symbols)
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