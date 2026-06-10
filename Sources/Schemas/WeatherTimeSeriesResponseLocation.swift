import Foundation

/// Location information
public enum WeatherTimeSeriesResponseLocation: Codable, Hashable, Sendable {
    case weatherTimeSeriesResponseLocationCity(WeatherTimeSeriesResponseLocationCity)
    case weatherTimeSeriesResponseLocationContinentCode(WeatherTimeSeriesResponseLocationContinentCode)
    case weatherTimeSeriesResponseLocationZero(WeatherTimeSeriesResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(WeatherTimeSeriesResponseLocationCity.self) {
            self = .weatherTimeSeriesResponseLocationCity(value)
        } else if let value = try? container.decode(WeatherTimeSeriesResponseLocationContinentCode.self) {
            self = .weatherTimeSeriesResponseLocationContinentCode(value)
        } else if let value = try? container.decode(WeatherTimeSeriesResponseLocationZero.self) {
            self = .weatherTimeSeriesResponseLocationZero(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .weatherTimeSeriesResponseLocationCity(let value):
            try container.encode(value)
        case .weatherTimeSeriesResponseLocationContinentCode(let value):
            try container.encode(value)
        case .weatherTimeSeriesResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}