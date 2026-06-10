import Foundation

public struct TimezoneLookupResponseTimeZoneDstStart: Codable, Hashable, Sendable {
    public let utcTime: String?
    public let duration: String?
    public let gap: Bool?
    public let dateTimeAfter: String?
    public let dateTimeBefore: String?
    public let overlap: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        utcTime: String? = nil,
        duration: String? = nil,
        gap: Bool? = nil,
        dateTimeAfter: String? = nil,
        dateTimeBefore: String? = nil,
        overlap: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.utcTime = utcTime
        self.duration = duration
        self.gap = gap
        self.dateTimeAfter = dateTimeAfter
        self.dateTimeBefore = dateTimeBefore
        self.overlap = overlap
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.utcTime = try container.decodeIfPresent(String.self, forKey: .utcTime)
        self.duration = try container.decodeIfPresent(String.self, forKey: .duration)
        self.gap = try container.decodeIfPresent(Bool.self, forKey: .gap)
        self.dateTimeAfter = try container.decodeIfPresent(String.self, forKey: .dateTimeAfter)
        self.dateTimeBefore = try container.decodeIfPresent(String.self, forKey: .dateTimeBefore)
        self.overlap = try container.decodeIfPresent(Bool.self, forKey: .overlap)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.utcTime, forKey: .utcTime)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.gap, forKey: .gap)
        try container.encodeIfPresent(self.dateTimeAfter, forKey: .dateTimeAfter)
        try container.encodeIfPresent(self.dateTimeBefore, forKey: .dateTimeBefore)
        try container.encodeIfPresent(self.overlap, forKey: .overlap)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case utcTime = "utc_time"
        case duration
        case gap
        case dateTimeAfter = "date_time_after"
        case dateTimeBefore = "date_time_before"
        case overlap
    }
}