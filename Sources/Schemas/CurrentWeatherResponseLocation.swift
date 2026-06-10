import Foundation

/// Location information
public enum CurrentWeatherResponseLocation: Codable, Hashable, Sendable {
    case currentWeatherResponseLocationCity(CurrentWeatherResponseLocationCity)
    case currentWeatherResponseLocationContinentCode(CurrentWeatherResponseLocationContinentCode)
    case currentWeatherResponseLocationZero(CurrentWeatherResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CurrentWeatherResponseLocationCity.self) {
            self = .currentWeatherResponseLocationCity(value)
        } else if let value = try? container.decode(CurrentWeatherResponseLocationContinentCode.self) {
            self = .currentWeatherResponseLocationContinentCode(value)
        } else if let value = try? container.decode(CurrentWeatherResponseLocationZero.self) {
            self = .currentWeatherResponseLocationZero(value)
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
        case .currentWeatherResponseLocationCity(let value):
            try container.encode(value)
        case .currentWeatherResponseLocationContinentCode(let value):
            try container.encode(value)
        case .currentWeatherResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}