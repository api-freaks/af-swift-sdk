import Foundation

public struct CurrencyTimeSeriesResponseHistoricalRatesListItem: Codable, Hashable, Sendable {
    /// Date of the specific exchange rates.
    public let date: String
    /// A map of currency symbols to their respective exchange rates for the given date.
    public let rates: [String: String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        rates: [String: String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.rates = rates
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.rates = try container.decode([String: String].self, forKey: .rates)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.rates, forKey: .rates)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case rates
    }
}