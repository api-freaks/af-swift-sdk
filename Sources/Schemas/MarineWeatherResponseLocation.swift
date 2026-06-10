import Foundation

/// Location information
public enum MarineWeatherResponseLocation: Codable, Hashable, Sendable {
    case marineWeatherResponseLocationCity(MarineWeatherResponseLocationCity)
    case marineWeatherResponseLocationContinentCode(MarineWeatherResponseLocationContinentCode)
    case marineWeatherResponseLocationZero(MarineWeatherResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(MarineWeatherResponseLocationCity.self) {
            self = .marineWeatherResponseLocationCity(value)
        } else if let value = try? container.decode(MarineWeatherResponseLocationContinentCode.self) {
            self = .marineWeatherResponseLocationContinentCode(value)
        } else if let value = try? container.decode(MarineWeatherResponseLocationZero.self) {
            self = .marineWeatherResponseLocationZero(value)
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
        case .marineWeatherResponseLocationCity(let value):
            try container.encode(value)
        case .marineWeatherResponseLocationContinentCode(let value):
            try container.encode(value)
        case .marineWeatherResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}