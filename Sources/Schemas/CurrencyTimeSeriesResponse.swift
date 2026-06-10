import Foundation

public struct CurrencyTimeSeriesResponse: Codable, Hashable, Sendable {
    /// Starting date of the interval (provided via input).
    public let startDate: String
    /// Ending date of the interval (provided via input).
    public let endDate: String
    /// Base currency with respect to which all rates are calculated.
    public let base: String
    /// List of historical exchange rates within the specified interval.
    public let historicalRatesList: [CurrencyTimeSeriesResponseHistoricalRatesListItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startDate: String,
        endDate: String,
        base: String,
        historicalRatesList: [CurrencyTimeSeriesResponseHistoricalRatesListItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startDate = startDate
        self.endDate = endDate
        self.base = base
        self.historicalRatesList = historicalRatesList
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startDate = try container.decode(String.self, forKey: .startDate)
        self.endDate = try container.decode(String.self, forKey: .endDate)
        self.base = try container.decode(String.self, forKey: .base)
        self.historicalRatesList = try container.decode([CurrencyTimeSeriesResponseHistoricalRatesListItem].self, forKey: .historicalRatesList)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.startDate, forKey: .startDate)
        try container.encode(self.endDate, forKey: .endDate)
        try container.encode(self.base, forKey: .base)
        try container.encode(self.historicalRatesList, forKey: .historicalRatesList)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startDate
        case endDate
        case base
        case historicalRatesList
    }
}