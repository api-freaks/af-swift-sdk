import Foundation

public struct GetCitiesResponseCitiesItem: Codable, Hashable, Sendable {
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let adminUnit: GetCitiesResponseCitiesItemAdminUnit
    public let isoAlpha2: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        latitude: Double,
        longitude: Double,
        adminUnit: GetCitiesResponseCitiesItemAdminUnit,
        isoAlpha2: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.adminUnit = adminUnit
        self.isoAlpha2 = isoAlpha2
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.adminUnit = try container.decode(GetCitiesResponseCitiesItemAdminUnit.self, forKey: .adminUnit)
        self.isoAlpha2 = try container.decode(String.self, forKey: .isoAlpha2)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.adminUnit, forKey: .adminUnit)
        try container.encode(self.isoAlpha2, forKey: .isoAlpha2)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case latitude
        case longitude
        case adminUnit = "admin_unit"
        case isoAlpha2 = "iso_alpha_2"
    }
}