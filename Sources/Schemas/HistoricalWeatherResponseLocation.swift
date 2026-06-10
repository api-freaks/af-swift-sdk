import Foundation

/// Location information
public enum HistoricalWeatherResponseLocation: Codable, Hashable, Sendable {
    case historicalWeatherResponseLocationCity(HistoricalWeatherResponseLocationCity)
    case historicalWeatherResponseLocationContinentCode(HistoricalWeatherResponseLocationContinentCode)
    case historicalWeatherResponseLocationZero(HistoricalWeatherResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(HistoricalWeatherResponseLocationCity.self) {
            self = .historicalWeatherResponseLocationCity(value)
        } else if let value = try? container.decode(HistoricalWeatherResponseLocationContinentCode.self) {
            self = .historicalWeatherResponseLocationContinentCode(value)
        } else if let value = try? container.decode(HistoricalWeatherResponseLocationZero.self) {
            self = .historicalWeatherResponseLocationZero(value)
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
        case .historicalWeatherResponseLocationCity(let value):
            try container.encode(value)
        case .historicalWeatherResponseLocationContinentCode(let value):
            try container.encode(value)
        case .historicalWeatherResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}