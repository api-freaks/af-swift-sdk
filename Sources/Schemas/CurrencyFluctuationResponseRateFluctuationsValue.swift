import Foundation

public struct CurrencyFluctuationResponseRateFluctuationsValue: Codable, Hashable, Sendable {
    /// Starting rate of the currency during the interval.
    public let startRate: String
    /// Ending rate of the currency during the interval.
    public let endRate: String
    /// Absolute change in currency rate over the interval.
    public let change: String
    /// Percentage change in currency rate over the interval.
    public let percentChange: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startRate: String,
        endRate: String,
        change: String,
        percentChange: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startRate = startRate
        self.endRate = endRate
        self.change = change
        self.percentChange = percentChange
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startRate = try container.decode(String.self, forKey: .startRate)
        self.endRate = try container.decode(String.self, forKey: .endRate)
        self.change = try container.decode(String.self, forKey: .change)
        self.percentChange = try container.decode(String.self, forKey: .percentChange)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.startRate, forKey: .startRate)
        try container.encode(self.endRate, forKey: .endRate)
        try container.encode(self.change, forKey: .change)
        try container.encode(self.percentChange, forKey: .percentChange)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startRate
        case endRate
        case change
        case percentChange
    }
}