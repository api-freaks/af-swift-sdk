import Foundation

public enum WebScrapeRequestBody: Codable, Hashable, Sendable {
    case webScrapeRequestBodyBlockUrl(WebScrapeRequestBodyBlockUrl)
    case webScrapeRequestBodyOne(WebScrapeRequestBodyOne)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(WebScrapeRequestBodyBlockUrl.self) {
            self = .webScrapeRequestBodyBlockUrl(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyOne.self) {
            self = .webScrapeRequestBodyOne(value)
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
        case .webScrapeRequestBodyBlockUrl(let value):
            try container.encode(value)
        case .webScrapeRequestBodyOne(let value):
            try container.encode(value)
        }
    }
}