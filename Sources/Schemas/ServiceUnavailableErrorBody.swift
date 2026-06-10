import Foundation

public struct ServiceUnavailableErrorBody: Codable, Hashable, Sendable {
    public let timestamp: String?
    public let status: Int?
    public let error: String?
    public let message: String?
    public let path: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: String? = nil,
        status: Int? = nil,
        error: String? = nil,
        message: String? = nil,
        path: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.status = status
        self.error = error
        self.message = message
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(String.self, forKey: .timestamp)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case status
        case error
        case message
        case path
    }
}