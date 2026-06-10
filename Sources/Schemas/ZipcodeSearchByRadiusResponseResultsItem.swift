import Foundation

public struct ZipcodeSearchByRadiusResponseResultsItem: Codable, Hashable, Sendable {
    public let code: String?
    public let region: String?
    public let regionCode: String?
    public let city: String?
    public let district: String?
    public let distance: Float?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String? = nil,
        region: String? = nil,
        regionCode: String? = nil,
        city: String? = nil,
        district: String? = nil,
        distance: Float? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.region = region
        self.regionCode = regionCode
        self.city = city
        self.district = district
        self.distance = distance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.regionCode = try container.decodeIfPresent(String.self, forKey: .regionCode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.distance = try container.decodeIfPresent(Float.self, forKey: .distance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.regionCode, forKey: .regionCode)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.distance, forKey: .distance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case region
        case regionCode = "region_code"
        case city
        case district
        case distance
    }
}