import Foundation

/// Location information
public enum FloodForecastResponseLocation: Codable, Hashable, Sendable {
    case floodForecastResponseLocationContinentCode(FloodForecastResponseLocationContinentCode)
    case floodForecastResponseLocationCity(FloodForecastResponseLocationCity)
    case floodForecastResponseLocationZero(FloodForecastResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(FloodForecastResponseLocationContinentCode.self) {
            self = .floodForecastResponseLocationContinentCode(value)
        } else if let value = try? container.decode(FloodForecastResponseLocationCity.self) {
            self = .floodForecastResponseLocationCity(value)
        } else if let value = try? container.decode(FloodForecastResponseLocationZero.self) {
            self = .floodForecastResponseLocationZero(value)
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
        case .floodForecastResponseLocationContinentCode(let value):
            try container.encode(value)
        case .floodForecastResponseLocationCity(let value):
            try container.encode(value)
        case .floodForecastResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}