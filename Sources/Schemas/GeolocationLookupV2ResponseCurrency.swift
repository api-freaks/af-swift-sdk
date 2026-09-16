import Foundation

/// Currency information for the IP's country.
public struct GeolocationLookupV2ResponseCurrency: Codable, Hashable, Sendable {
    /// Currency code (ISO 4217).
    public let code: String?
    /// Currency name (ISO 4217).
    public let name: String?
    /// Currency symbol.
    public let symbol: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String? = nil,
        name: String? = nil,
        symbol: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.name = name
        self.symbol = symbol
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.symbol, forKey: .symbol)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case name
        case symbol
    }
}