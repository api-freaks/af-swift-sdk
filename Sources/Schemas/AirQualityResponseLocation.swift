import Foundation

/// Location information
public enum AirQualityResponseLocation: Codable, Hashable, Sendable {
    case airQualityResponseLocationCity(AirQualityResponseLocationCity)
    case airQualityResponseLocationContinentCode(AirQualityResponseLocationContinentCode)
    case airQualityResponseLocationZero(AirQualityResponseLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AirQualityResponseLocationCity.self) {
            self = .airQualityResponseLocationCity(value)
        } else if let value = try? container.decode(AirQualityResponseLocationContinentCode.self) {
            self = .airQualityResponseLocationContinentCode(value)
        } else if let value = try? container.decode(AirQualityResponseLocationZero.self) {
            self = .airQualityResponseLocationZero(value)
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
        case .airQualityResponseLocationCity(let value):
            try container.encode(value)
        case .airQualityResponseLocationContinentCode(let value):
            try container.encode(value)
        case .airQualityResponseLocationZero(let value):
            try container.encode(value)
        }
    }
}