import Foundation

/// Location information
public enum BulkCurrentWeatherResponseBulkItemLocation: Codable, Hashable, Sendable {
    case bulkCurrentWeatherResponseBulkItemLocationCity(BulkCurrentWeatherResponseBulkItemLocationCity)
    case bulkCurrentWeatherResponseBulkItemLocationContinentCode(BulkCurrentWeatherResponseBulkItemLocationContinentCode)
    case bulkCurrentWeatherResponseBulkItemLocationZero(BulkCurrentWeatherResponseBulkItemLocationZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BulkCurrentWeatherResponseBulkItemLocationCity.self) {
            self = .bulkCurrentWeatherResponseBulkItemLocationCity(value)
        } else if let value = try? container.decode(BulkCurrentWeatherResponseBulkItemLocationContinentCode.self) {
            self = .bulkCurrentWeatherResponseBulkItemLocationContinentCode(value)
        } else if let value = try? container.decode(BulkCurrentWeatherResponseBulkItemLocationZero.self) {
            self = .bulkCurrentWeatherResponseBulkItemLocationZero(value)
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
        case .bulkCurrentWeatherResponseBulkItemLocationCity(let value):
            try container.encode(value)
        case .bulkCurrentWeatherResponseBulkItemLocationContinentCode(let value):
            try container.encode(value)
        case .bulkCurrentWeatherResponseBulkItemLocationZero(let value):
            try container.encode(value)
        }
    }
}