import Foundation

public struct ScreenshotCaptureResponseClip: Codable, Hashable, Sendable {
    public let height: Int?
    public let width: Int?
    public let x: Int?
    public let y: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        height: Int? = nil,
        width: Int? = nil,
        x: Int? = nil,
        y: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.height = height
        self.width = width
        self.x = x
        self.y = y
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.x = try container.decodeIfPresent(Int.self, forKey: .x)
        self.y = try container.decodeIfPresent(Int.self, forKey: .y)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.width, forKey: .width)
        try container.encodeIfPresent(self.x, forKey: .x)
        try container.encodeIfPresent(self.y, forKey: .y)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case height
        case width
        case x
        case y
    }
}