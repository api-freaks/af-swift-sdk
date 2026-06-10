import Foundation

/// Daily flood forecast data for the date.
public struct FloodForecastResponseForecastValueDaily: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// The observed river discharge value (m³/s)
    public let riverDischarge: Double?
    /// The mean river discharge (m³/s)
    public let riverDischargeMean: Double?
    /// The median river discharge (m³/s)
    public let riverDischargeMedian: Double?
    /// The maximum river discharge (m³/s)
    public let riverDischargeMax: Double?
    /// The minimum river discharge (m³/s)
    public let riverDischargeMin: Double?
    /// The 25th percentile of river discharge (m³/s)
    public let riverDischargeP25: Double?
    /// The 75th percentile of river discharge (m³/s)
    public let riverDischargeP75: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        riverDischarge: Double? = nil,
        riverDischargeMean: Double? = nil,
        riverDischargeMedian: Double? = nil,
        riverDischargeMax: Double? = nil,
        riverDischargeMin: Double? = nil,
        riverDischargeP25: Double? = nil,
        riverDischargeP75: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.riverDischarge = riverDischarge
        self.riverDischargeMean = riverDischargeMean
        self.riverDischargeMedian = riverDischargeMedian
        self.riverDischargeMax = riverDischargeMax
        self.riverDischargeMin = riverDischargeMin
        self.riverDischargeP25 = riverDischargeP25
        self.riverDischargeP75 = riverDischargeP75
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.riverDischarge = try container.decodeIfPresent(Double.self, forKey: .riverDischarge)
        self.riverDischargeMean = try container.decodeIfPresent(Double.self, forKey: .riverDischargeMean)
        self.riverDischargeMedian = try container.decodeIfPresent(Double.self, forKey: .riverDischargeMedian)
        self.riverDischargeMax = try container.decodeIfPresent(Double.self, forKey: .riverDischargeMax)
        self.riverDischargeMin = try container.decodeIfPresent(Double.self, forKey: .riverDischargeMin)
        self.riverDischargeP25 = try container.decodeIfPresent(Double.self, forKey: .riverDischargeP25)
        self.riverDischargeP75 = try container.decodeIfPresent(Double.self, forKey: .riverDischargeP75)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.riverDischarge, forKey: .riverDischarge)
        try container.encodeIfPresent(self.riverDischargeMean, forKey: .riverDischargeMean)
        try container.encodeIfPresent(self.riverDischargeMedian, forKey: .riverDischargeMedian)
        try container.encodeIfPresent(self.riverDischargeMax, forKey: .riverDischargeMax)
        try container.encodeIfPresent(self.riverDischargeMin, forKey: .riverDischargeMin)
        try container.encodeIfPresent(self.riverDischargeP25, forKey: .riverDischargeP25)
        try container.encodeIfPresent(self.riverDischargeP75, forKey: .riverDischargeP75)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case riverDischarge = "river_discharge"
        case riverDischargeMean = "river_discharge_mean"
        case riverDischargeMedian = "river_discharge_median"
        case riverDischargeMax = "river_discharge_max"
        case riverDischargeMin = "river_discharge_min"
        case riverDischargeP25 = "river_discharge_p25"
        case riverDischargeP75 = "river_discharge_p75"
    }
}