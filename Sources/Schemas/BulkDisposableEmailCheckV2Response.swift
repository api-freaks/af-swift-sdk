import Foundation

/// Wrapper containing the per-email results array.
public struct BulkDisposableEmailCheckV2Response: Codable, Hashable, Sendable {
    /// Array of per-email results, one entry per requested email, in the same order as the request.
    public let disposableEmailResponse: [BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disposableEmailResponse: [BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.disposableEmailResponse = disposableEmailResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.disposableEmailResponse = try container.decode([BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItem].self, forKey: .disposableEmailResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.disposableEmailResponse, forKey: .disposableEmailResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disposableEmailResponse
    }
}