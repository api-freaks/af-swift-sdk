import Foundation

public struct CurrencyLatestRatesResponse: Codable, Hashable, Sendable {
    /// For the latest currencies exchange rates endpoint, it is the date and time with timezone (UTC) at which these rates were recorded. For historical currencies exchange rates endpoint, it is the specific date in YYYY-MM-DD format.
    public let date: String
    /// Base currency used for calculating exchange rates.
    public let base: String
    /// A map of currency codes to their exchange rate against the base currency.
    public let rates: [String: String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        base: String,
        rates: [String: String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.base = base
        self.rates = rates
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.base = try container.decode(String.self, forKey: .base)
        self.rates = try container.decode([String: String].self, forKey: .rates)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.base, forKey: .base)
        try container.encode(self.rates, forKey: .rates)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case base
        case rates
    }
}