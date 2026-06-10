import Foundation

public struct CurrencyFluctuationResponse: Codable, Hashable, Sendable {
    /// Starting date of the interval (provided via input).
    public let startDate: String
    /// Ending date of the interval (provided via input).
    public let endDate: String
    /// Base currency with respect to which all fluctuations are calculated.
    public let base: String
    /// A map of currency symbols to their fluctuation details.
    public let rateFluctuations: [String: CurrencyFluctuationResponseRateFluctuationsValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startDate: String,
        endDate: String,
        base: String,
        rateFluctuations: [String: CurrencyFluctuationResponseRateFluctuationsValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startDate = startDate
        self.endDate = endDate
        self.base = base
        self.rateFluctuations = rateFluctuations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startDate = try container.decode(String.self, forKey: .startDate)
        self.endDate = try container.decode(String.self, forKey: .endDate)
        self.base = try container.decode(String.self, forKey: .base)
        self.rateFluctuations = try container.decode([String: CurrencyFluctuationResponseRateFluctuationsValue].self, forKey: .rateFluctuations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.startDate, forKey: .startDate)
        try container.encode(self.endDate, forKey: .endDate)
        try container.encode(self.base, forKey: .base)
        try container.encode(self.rateFluctuations, forKey: .rateFluctuations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startDate
        case endDate
        case base
        case rateFluctuations
    }
}