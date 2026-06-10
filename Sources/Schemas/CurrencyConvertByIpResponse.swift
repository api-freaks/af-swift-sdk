import Foundation

public struct CurrencyConvertByIpResponse: Codable, Hashable, Sendable {
    /// Date and time with timezone (UTC) representing the exact time at which the conversion rate was recorded.
    public let date: String
    /// Base currency code whose amount will be converted.
    public let from: String
    /// Desired currency code for the converted amount.
    public let to: String
    /// Current conversion rate with the base currency as the desired converted currency and the quote currency as the 'from' currency code.
    public let rate: String
    /// IP Address whose country's currency will be extracted and used as 'to'. Defaults to the request IP if not provided.
    public let ipAddress: String
    /// The amount to be converted.
    public let givenAmount: String
    /// Converted amount in the desired currency.
    public let convertedAmount: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        from: String,
        to: String,
        rate: String,
        ipAddress: String,
        givenAmount: String,
        convertedAmount: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.from = from
        self.to = to
        self.rate = rate
        self.ipAddress = ipAddress
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
        self.ipAddress = try container.decode(String.self, forKey: .ipAddress)
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
        try container.encode(self.ipAddress, forKey: .ipAddress)
        try container.encode(self.givenAmount, forKey: .givenAmount)
        try container.encode(self.convertedAmount, forKey: .convertedAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case from
        case to
        case rate
        case ipAddress
        case givenAmount
        case convertedAmount
    }
}