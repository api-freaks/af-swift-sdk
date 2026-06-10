import Foundation

public struct BulkEmailValidateResponseEmailValidationResponsesItemAddressLocation: Codable, Hashable, Sendable {
    public let city: String?
    public let district: String?
    public let confidence: String?
    public let zipcode: String?
    public let stateProv: String?
    public let countryName: String?
    public let continentName: String?
    public let continentCode: String?
    public let countryCode2: String?
    public let countryCode3: String?
    public let countryNameOfficial: String?
    public let accuracyRadius: String?
    public let isEu: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: String? = nil,
        district: String? = nil,
        confidence: String? = nil,
        zipcode: String? = nil,
        stateProv: String? = nil,
        countryName: String? = nil,
        continentName: String? = nil,
        continentCode: String? = nil,
        countryCode2: String? = nil,
        countryCode3: String? = nil,
        countryNameOfficial: String? = nil,
        accuracyRadius: String? = nil,
        isEu: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.district = district
        self.confidence = confidence
        self.zipcode = zipcode
        self.stateProv = stateProv
        self.countryName = countryName
        self.continentName = continentName
        self.continentCode = continentCode
        self.countryCode2 = countryCode2
        self.countryCode3 = countryCode3
        self.countryNameOfficial = countryNameOfficial
        self.accuracyRadius = accuracyRadius
        self.isEu = isEu
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.confidence = try container.decodeIfPresent(String.self, forKey: .confidence)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.stateProv = try container.decodeIfPresent(String.self, forKey: .stateProv)
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.continentName = try container.decodeIfPresent(String.self, forKey: .continentName)
        self.continentCode = try container.decodeIfPresent(String.self, forKey: .continentCode)
        self.countryCode2 = try container.decodeIfPresent(String.self, forKey: .countryCode2)
        self.countryCode3 = try container.decodeIfPresent(String.self, forKey: .countryCode3)
        self.countryNameOfficial = try container.decodeIfPresent(String.self, forKey: .countryNameOfficial)
        self.accuracyRadius = try container.decodeIfPresent(String.self, forKey: .accuracyRadius)
        self.isEu = try container.decodeIfPresent(Bool.self, forKey: .isEu)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.confidence, forKey: .confidence)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
        try container.encodeIfPresent(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.continentName, forKey: .continentName)
        try container.encodeIfPresent(self.continentCode, forKey: .continentCode)
        try container.encodeIfPresent(self.countryCode2, forKey: .countryCode2)
        try container.encodeIfPresent(self.countryCode3, forKey: .countryCode3)
        try container.encodeIfPresent(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encodeIfPresent(self.accuracyRadius, forKey: .accuracyRadius)
        try container.encodeIfPresent(self.isEu, forKey: .isEu)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case district
        case confidence
        case zipcode
        case stateProv = "state_prov"
        case countryName = "country_name"
        case continentName = "continent_name"
        case continentCode = "continent_code"
        case countryCode2 = "country_code2"
        case countryCode3 = "country_code3"
        case countryNameOfficial = "country_name_official"
        case accuracyRadius = "accuracy_radius"
        case isEu = "is_eu"
    }
}