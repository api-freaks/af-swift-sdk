import Foundation

public struct ZipcodeDistanceResponse: Codable, Hashable, Sendable {
    /// Number of distance results returned
    public let resultsCount: String?
    public let results: [ZipcodeDistanceResponseResultsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        resultsCount: String? = nil,
        results: [ZipcodeDistanceResponseResultsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.resultsCount = resultsCount
        self.results = results
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultsCount = try container.decodeIfPresent(String.self, forKey: .resultsCount)
        self.results = try container.decodeIfPresent([ZipcodeDistanceResponseResultsItem].self, forKey: .results)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.resultsCount, forKey: .resultsCount)
        try container.encodeIfPresent(self.results, forKey: .results)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case resultsCount = "results_count"
        case results
    }
}