import Foundation

/// Location information
public enum WeatherForecastResponseLocation: Codable, Hashable, Sendable {
    case weatherForecastResponseLocationContinentCode(WeatherForecastResponseLocationContinentCode)
    case weatherForecastResponseLocationCity(WeatherForecastResponseLocationCity)
    case weatherForecastResponseLocationZero(WeatherForecastResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(WeatherForecastResponseLocationContinentCode.self) {
            self = .weatherForecastResponseLocationContinentCode(value)
        } else if let value = try? container.decode(WeatherForecastResponseLocationCity.self) {
            self = .weatherForecastResponseLocationCity(value)
        } else if let value = try? container.decode(WeatherForecastResponseLocationZero.self) {
            self = .weatherForecastResponseLocationZero(value)
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
        case .weatherForecastResponseLocationContinentCode(let value):
            try container.encode(value)
        case .weatherForecastResponseLocationCity(let value):
            try container.encode(value)
        case .weatherForecastResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}