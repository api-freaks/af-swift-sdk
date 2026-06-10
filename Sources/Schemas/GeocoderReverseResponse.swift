import Foundation

public struct GeocoderReverseResponse: Codable, Hashable, Sendable {
    /// WGS84 latitude value for the location.
    public let lat: Float
    /// WGS84 longitude value for the location.
    public let lon: Float
    /// Name for the primary place searched.
    public let name: String?
    /// High-level category of the place, e.g. amenity, place, natural, building, highway.
    public let category: String?
    /// Specific kind within the category, e.g. fast_food, city, park, residential, house_number.
    public let type: String?
    /// Array describing the POI (point of interest) and closely related elements at this location.
    public let poi: [GeocoderReverseResponsePoiItem]?
    /// Street or road name.
    public let street: String?
    /// Intra-city area below city level, e.g. suburb, borough, quarter, ward, district, sector, zone, tehsil, taluka, neighbourhood.
    public let area: String?
    /// Postal code of the area.
    public let postcode: String?
    /// Settlement label appropriate to the country, e.g. city, town, municipality.
    public let city: String?
    /// Second-tier administrative area, e.g. county, district, shire, prefecture.
    public let county: String?
    /// Subdivision code when available, typically ISO-3166-2 like US-TX or PK-PB.
    public let stateCode: String?
    /// First-tier administrative area; varies by country, e.g. state, region, province, division, autonomous community.
    public let state: String?
    /// Two-letter country code in upper case, ISO-3166-1 alpha-2.
    public let countryCode: String
    /// Country name of the searched place.
    public let country: String
    /// Single-line, human-readable address of the location.
    public let fullAddress: String
    /// Extent of the feature as `[lat_min, lat_max, lon_min, lon_max]` (south, north, west, east) in WGS84 decimal degrees.
    public let boundingBox: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        lat: Float,
        lon: Float,
        name: String? = nil,
        category: String? = nil,
        type: String? = nil,
        poi: [GeocoderReverseResponsePoiItem]? = nil,
        street: String? = nil,
        area: String? = nil,
        postcode: String? = nil,
        city: String? = nil,
        county: String? = nil,
        stateCode: String? = nil,
        state: String? = nil,
        countryCode: String,
        country: String,
        fullAddress: String,
        boundingBox: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.lat = lat
        self.lon = lon
        self.name = name
        self.category = category
        self.type = type
        self.poi = poi
        self.street = street
        self.area = area
        self.postcode = postcode
        self.city = city
        self.county = county
        self.stateCode = stateCode
        self.state = state
        self.countryCode = countryCode
        self.country = country
        self.fullAddress = fullAddress
        self.boundingBox = boundingBox
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(Float.self, forKey: .lat)
        self.lon = try container.decode(Float.self, forKey: .lon)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.poi = try container.decodeIfPresent([GeocoderReverseResponsePoiItem].self, forKey: .poi)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.area = try container.decodeIfPresent(String.self, forKey: .area)
        self.postcode = try container.decodeIfPresent(String.self, forKey: .postcode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.county = try container.decodeIfPresent(String.self, forKey: .county)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.country = try container.decode(String.self, forKey: .country)
        self.fullAddress = try container.decode(String.self, forKey: .fullAddress)
        self.boundingBox = try container.decode([String].self, forKey: .boundingBox)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.lat, forKey: .lat)
        try container.encode(self.lon, forKey: .lon)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.poi, forKey: .poi)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.area, forKey: .area)
        try container.encodeIfPresent(self.postcode, forKey: .postcode)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.county, forKey: .county)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.fullAddress, forKey: .fullAddress)
        try container.encode(self.boundingBox, forKey: .boundingBox)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case lat
        case lon
        case name
        case category
        case type
        case poi
        case street
        case area
        case postcode
        case city
        case county
        case stateCode = "state_code"
        case state
        case countryCode = "country_code"
        case country
        case fullAddress = "full_address"
        case boundingBox = "bounding_box"
    }
}