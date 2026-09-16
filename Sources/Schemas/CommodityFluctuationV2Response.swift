import Foundation

public struct CommodityFluctuationV2Response: Codable, Hashable, Sendable {
    /// API request success indicator. "true" for successful requests.
    public let success: Bool
    /// The start date of the fluctuation interval in YYYY-MM-DD format.
    public let startDate: String
    /// The end date of the fluctuation interval in YYYY-MM-DD format.
    public let endDate: String
    /// Map keyed by commodity symbol; value contains fluctuation metrics.
    public let rates: [String: CommodityFluctuationV2ResponseRatesValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        startDate: String,
        endDate: String,
        rates: [String: CommodityFluctuationV2ResponseRatesValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.startDate = startDate
        self.endDate = endDate
        self.rates = rates
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.startDate = try container.decode(String.self, forKey: .startDate)
        self.endDate = try container.decode(String.self, forKey: .endDate)
        self.rates = try container.decode([String: CommodityFluctuationV2ResponseRatesValue].self, forKey: .rates)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.startDate, forKey: .startDate)
        try container.encode(self.endDate, forKey: .endDate)
        try container.encode(self.rates, forKey: .rates)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case startDate
        case endDate
        case rates
    }
}