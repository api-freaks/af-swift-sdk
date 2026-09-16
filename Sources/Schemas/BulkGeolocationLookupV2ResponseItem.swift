import Foundation

public enum BulkGeolocationLookupV2ResponseItem: Codable, Hashable, Sendable {
    /// Geolocation and threat intelligence result for one successfully resolved IP address.
    case bulkGeolocationLookupV2ResponseItemAbuse(BulkGeolocationLookupV2ResponseItemAbuse)
    /// Per-item error, returned in place of a location result when an individual IP is invalid, bogon/reserved, or not found in the database.
    case bulkGeolocationLookupV2ResponseItemMessage(BulkGeolocationLookupV2ResponseItemMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BulkGeolocationLookupV2ResponseItemAbuse.self) {
            self = .bulkGeolocationLookupV2ResponseItemAbuse(value)
        } else if let value = try? container.decode(BulkGeolocationLookupV2ResponseItemMessage.self) {
            self = .bulkGeolocationLookupV2ResponseItemMessage(value)
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
        case .bulkGeolocationLookupV2ResponseItemAbuse(let value):
            try container.encode(value)
        case .bulkGeolocationLookupV2ResponseItemMessage(let value):
            try container.encode(value)
        }
    }
}