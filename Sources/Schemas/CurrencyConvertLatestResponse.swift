import Foundation

public struct CurrencyConvertLatestResponse: Codable, Hashable, Sendable {
    /// For the latest rates converter, it is the date and time with timezone (UTC) when the rate was recorded. For historical converter, it is the date provided in the input (format: YYYY-MM-DD).
    public let date: String
    /// Base currency code (the currency being converted from).
    public let from: String
    /// Desired currency code (the currency to convert to).
    public let to: String
    /// Conversion rate from base currency to desired currency.
    public let rate: String
    /// The amount in base currency to be converted.
    public let givenAmount: String
    /// The result of the conversion in the desired currency.
    public let convertedAmount: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        from: String,
        to: String,
        rate: String,
        givenAmount: String,
        convertedAmount: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.from = from
        self.to = to
        self.rate = rate
        self.givenAmount = givenAmount
        self.convertedAmount = convertedAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.from = try container.decode(String.self, forKey: .from)
        self.to = try container.decode(String.self, forKey: .to)
        self.rate = try container.decode(String.self, forKey: .rate)
        self.givenAmount = try container.decode(String.self, forKey: .givenAmount)
        self.convertedAmount = try container.decode(String.self, forKey: .convertedAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.to, forKey: .to)
        try container.encode(self.rate, forKey: .rate)
        try container.encode(self.givenAmount, forKey: .givenAmount)
        try container.encode(self.convertedAmount, forKey: .convertedAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case from
        case to
        case rate
        case givenAmount
        case convertedAmount
    }
}