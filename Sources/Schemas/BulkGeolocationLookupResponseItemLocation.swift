import Foundation

public struct BulkGeolocationLookupResponseItemLocation: Codable, Hashable, Sendable {
    public let continentCode: String?
    public let continentName: String?
    public let countryCode2: String?
    public let countryCode3: String?
    public let countryName: String?
    public let countryNameOfficial: String?
    public let countryCapital: String?
    public let stateProv: String?
    public let stateCode: String?
    public let district: String?
    public let city: String?
    public let locality: String?
    public let accuracyRadius: String?
    public let confidence: String?
    public let dmaCode: String?
    public let zipcode: String?
    public let latitude: String?
    public let longitude: String?
    public let isEu: Bool?
    public let countryFlag: String?
    public let geonameId: String?
    public let countryEmoji: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        continentCode: String? = nil,
        continentName: String? = nil,
        countryCode2: String? = nil,
        countryCode3: String? = nil,
        countryName: String? = nil,
        countryNameOfficial: String? = nil,
        countryCapital: String? = nil,
        stateProv: String? = nil,
        stateCode: String? = nil,
        district: String? = nil,
        city: String? = nil,
        locality: String? = nil,
        accuracyRadius: String? = nil,
        confidence: String? = nil,
        dmaCode: String? = nil,
        zipcode: String? = nil,
        latitude: String? = nil,
        longitude: String? = nil,
        isEu: Bool? = nil,
        countryFlag: String? = nil,
        geonameId: String? = nil,
        countryEmoji: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.continentCode = continentCode
        self.continentName = continentName
        self.countryCode2 = countryCode2
        self.countryCode3 = countryCode3
        self.countryName = countryName
        self.countryNameOfficial = countryNameOfficial
        self.countryCapital = countryCapital
        self.stateProv = stateProv
        self.stateCode = stateCode
        self.district = district
        self.city = city
        self.locality = locality
        self.accuracyRadius = accuracyRadius
        self.confidence = confidence
        self.dmaCode = dmaCode
        self.zipcode = zipcode
        self.latitude = latitude
        self.longitude = longitude
        self.isEu = isEu
        self.countryFlag = countryFlag
        self.geonameId = geonameId
        self.countryEmoji = countryEmoji
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.continentCode = try container.decodeIfPresent(String.self, forKey: .continentCode)
        self.continentName = try container.decodeIfPresent(String.self, forKey: .continentName)
        self.countryCode2 = try container.decodeIfPresent(String.self, forKey: .countryCode2)
        self.countryCode3 = try container.decodeIfPresent(String.self, forKey: .countryCode3)
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.countryNameOfficial = try container.decodeIfPresent(String.self, forKey: .countryNameOfficial)
        self.countryCapital = try container.decodeIfPresent(String.self, forKey: .countryCapital)
        self.stateProv = try container.decodeIfPresent(String.self, forKey: .stateProv)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.accuracyRadius = try container.decodeIfPresent(String.self, forKey: .accuracyRadius)
        self.confidence = try container.decodeIfPresent(String.self, forKey: .confidence)
        self.dmaCode = try container.decodeIfPresent(String.self, forKey: .dmaCode)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(String.self, forKey: .longitude)
        self.isEu = try container.decodeIfPresent(Bool.self, forKey: .isEu)
        self.countryFlag = try container.decodeIfPresent(String.self, forKey: .countryFlag)
        self.geonameId = try container.decodeIfPresent(String.self, forKey: .geonameId)
        self.countryEmoji = try container.decodeIfPresent(String.self, forKey: .countryEmoji)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.continentCode, forKey: .continentCode)
        try container.encodeIfPresent(self.continentName, forKey: .continentName)
        try container.encodeIfPresent(self.countryCode2, forKey: .countryCode2)
        try container.encodeIfPresent(self.countryCode3, forKey: .countryCode3)
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encodeIfPresent(self.countryCapital, forKey: .countryCapital)
        try container.encodeIfPresent(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.accuracyRadius, forKey: .accuracyRadius)
        try container.encodeIfPresent(self.confidence, forKey: .confidence)
        try container.encodeIfPresent(self.dmaCode, forKey: .dmaCode)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.isEu, forKey: .isEu)
        try container.encodeIfPresent(self.countryFlag, forKey: .countryFlag)
        try container.encodeIfPresent(self.geonameId, forKey: .geonameId)
        try container.encodeIfPresent(self.countryEmoji, forKey: .countryEmoji)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case continentCode = "continent_code"
        case continentName = "continent_name"
        case countryCode2 = "country_code2"
        case countryCode3 = "country_code3"
        case countryName = "country_name"
        case countryNameOfficial = "country_name_official"
        case countryCapital = "country_capital"
        case stateProv = "state_prov"
        case stateCode = "state_code"
        case district
        case city
        case locality
        case accuracyRadius = "accuracy_radius"
        case confidence
        case dmaCode = "dma_code"
        case zipcode
        case latitude
        case longitude
        case isEu = "is_eu"
        case countryFlag = "country_flag"
        case geonameId = "geoname_id"
        case countryEmoji = "country_emoji"
    }
}