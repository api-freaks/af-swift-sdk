import Foundation

public struct VatSupportedCountriesResponseVatSupportedCountriesAndStatesItemValue: Codable, Hashable, Sendable {
    /// ISO 3166-1 alpha-2 country code, lowercase.
    public let code: String
    /// Sub-national regions with their own VAT data, keyed by name (e.g. `california`: `us:ca`).
    public let states: [String: String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String,
        states: [String: String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.states = states
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(String.self, forKey: .code)
        self.states = try container.decodeIfPresent([String: String].self, forKey: .states)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encodeIfPresent(self.states, forKey: .states)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case states
    }
}