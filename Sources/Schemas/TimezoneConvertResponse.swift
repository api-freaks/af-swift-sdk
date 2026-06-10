import Foundation

public struct TimezoneConvertResponse: Codable, Hashable, Sendable {
    /// Original time before conversion
    public let originalTime: Date
    /// Time after conversion
    public let convertedTime: Date
    /// Difference in hours
    public let diffHour: Float
    /// Difference in minutes
    public let diffMin: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        originalTime: Date,
        convertedTime: Date,
        diffHour: Float,
        diffMin: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.originalTime = originalTime
        self.convertedTime = convertedTime
        self.diffHour = diffHour
        self.diffMin = diffMin
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.originalTime = try container.decode(Date.self, forKey: .originalTime)
        self.convertedTime = try container.decode(Date.self, forKey: .convertedTime)
        self.diffHour = try container.decode(Float.self, forKey: .diffHour)
        self.diffMin = try container.decode(Float.self, forKey: .diffMin)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.originalTime, forKey: .originalTime)
        try container.encode(self.convertedTime, forKey: .convertedTime)
        try container.encode(self.diffHour, forKey: .diffHour)
        try container.encode(self.diffMin, forKey: .diffMin)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case originalTime = "original_time"
        case convertedTime = "converted_time"
        case diffHour = "diff_hour"
        case diffMin = "diff_min"
    }
}