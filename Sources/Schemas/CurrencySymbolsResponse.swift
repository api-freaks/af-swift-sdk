import Foundation

public struct CurrencySymbolsResponse: Codable, Hashable, Sendable {
    /// A map of all currency symbols keyed by currency code; value is the full currency name.
    public let currencySymbols: [String: String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currencySymbols: [String: String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currencySymbols = currencySymbols
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currencySymbols = try container.decode([String: String].self, forKey: .currencySymbols)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currencySymbols, forKey: .currencySymbols)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currencySymbols
    }
}