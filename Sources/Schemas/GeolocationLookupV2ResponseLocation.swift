import Foundation

/// Geographic location information for the IP.
public struct GeolocationLookupV2ResponseLocation: Codable, Hashable, Sendable {
    /// 2-letter code of the continent.
    public let continentCode: String
    /// Name of the continent.
    public let continentName: String
    /// Country code (ISO 3166-1 alpha-2) of the country.
    public let countryCode2: String
    /// Country code (ISO 3166-1 alpha-3) of the country.
    public let countryCode3: String
    /// Name of the country.
    public let countryName: String
    /// Official name (ISO 3166) of the country.
    public let countryNameOfficial: String
    /// Name of the country's capital.
    public let countryCapital: String
    /// Name of the state/province/region.
    public let stateProv: String?
    /// Code of the state/province/region.
    public let stateCode: String?
    /// Name of the district or county.
    public let district: String?
    /// Name of the city.
    public let city: String?
    /// A more specific area in city or it can be same as city.
    public let locality: String?
    /// Circular radius in Km, where the IP address location can be found.
    public let accuracyRadius: String?
    /// Confidence level of the location match (e.g., low, medium, high).
    public let confidence: String?
    /// Designated Market Area (DMA) code used in the United States for media marketing.
    public let dmaCode: Nullable<String>?
    /// ZIP/Postal code of the place.
    public let zipcode: String?
    /// Latitude of the place.
    public let latitude: String
    /// Longitude of the place.
    public let longitude: String
    /// Is the country belong to European Union?
    public let isEu: Bool
    /// URL to get the country flag.
    public let countryFlag: String
    /// Geoname ID of the place from geonames.org.
    public let geonameId: String?
    /// Emoji of the Country flag.
    public let countryEmoji: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        continentCode: String,
        continentName: String,
        countryCode2: String,
        countryCode3: String,
        countryName: String,
        countryNameOfficial: String,
        countryCapital: String,
        stateProv: String? = nil,
        stateCode: String? = nil,
        district: String? = nil,
        city: String? = nil,
        locality: String? = nil,
        accuracyRadius: String? = nil,
        confidence: String? = nil,
        dmaCode: Nullable<String>? = nil,
        zipcode: String? = nil,
        latitude: String,
        longitude: String,
        isEu: Bool,
        countryFlag: String,
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
        self.continentCode = try container.decode(String.self, forKey: .continentCode)
        self.continentName = try container.decode(String.self, forKey: .continentName)
        self.countryCode2 = try container.decode(String.self, forKey: .countryCode2)
        self.countryCode3 = try container.decode(String.self, forKey: .countryCode3)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.countryNameOfficial = try container.decode(String.self, forKey: .countryNameOfficial)
        self.countryCapital = try container.decode(String.self, forKey: .countryCapital)
        self.stateProv = try container.decodeIfPresent(String.self, forKey: .stateProv)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.accuracyRadius = try container.decodeIfPresent(String.self, forKey: .accuracyRadius)
        self.confidence = try container.decodeIfPresent(String.self, forKey: .confidence)
        self.dmaCode = try container.decodeNullableIfPresent(String.self, forKey: .dmaCode)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.isEu = try container.decode(Bool.self, forKey: .isEu)
        self.countryFlag = try container.decode(String.self, forKey: .countryFlag)
        self.geonameId = try container.decodeIfPresent(String.self, forKey: .geonameId)
        self.countryEmoji = try container.decodeIfPresent(String.self, forKey: .countryEmoji)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.continentCode, forKey: .continentCode)
        try container.encode(self.continentName, forKey: .continentName)
        try container.encode(self.countryCode2, forKey: .countryCode2)
        try container.encode(self.countryCode3, forKey: .countryCode3)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encode(self.countryCapital, forKey: .countryCapital)
        try container.encodeIfPresent(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.accuracyRadius, forKey: .accuracyRadius)
        try container.encodeIfPresent(self.confidence, forKey: .confidence)
        try container.encodeNullableIfPresent(self.dmaCode, forKey: .dmaCode)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.isEu, forKey: .isEu)
        try container.encode(self.countryFlag, forKey: .countryFlag)
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