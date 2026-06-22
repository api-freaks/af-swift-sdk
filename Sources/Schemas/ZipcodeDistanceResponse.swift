import Foundation

public struct ZipcodeDistanceResponse: Codable, Hashable, Sendable {
    /// Number of distance results returned
    public let resultCount: Int?
    public let results: [ZipcodeDistanceResponseResultsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        resultCount: Int? = nil,
        results: [ZipcodeDistanceResponseResultsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.resultCount = resultCount
        self.results = results
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount)
        self.results = try container.decodeIfPresent([ZipcodeDistanceResponseResultsItem].self, forKey: .results)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.resultCount, forKey: .resultCount)
        try container.encodeIfPresent(self.results, forKey: .results)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case resultCount = "result_count"
        case results
    }
}