import Foundation

public struct CurrencySupportedResponse: Codable, Hashable, Sendable {
    /// A map of all supported currencies, keyed by currency code.
    public let supportedCurrenciesMap: [String: CurrencySupportedResponseSupportedCurrenciesMapValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        supportedCurrenciesMap: [String: CurrencySupportedResponseSupportedCurrenciesMapValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.supportedCurrenciesMap = supportedCurrenciesMap
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.supportedCurrenciesMap = try container.decode([String: CurrencySupportedResponseSupportedCurrenciesMapValue].self, forKey: .supportedCurrenciesMap)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.supportedCurrenciesMap, forKey: .supportedCurrenciesMap)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case supportedCurrenciesMap
    }
}