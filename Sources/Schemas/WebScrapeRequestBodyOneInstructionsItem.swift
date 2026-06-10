import Foundation

public enum WebScrapeRequestBodyOneInstructionsItem: Codable, Hashable, Sendable {
    case webScrapeRequestBodyOneInstructionsItemExtract(WebScrapeRequestBodyOneInstructionsItemExtract)
    case webScrapeRequestBodyOneInstructionsItemGetForm(WebScrapeRequestBodyOneInstructionsItemGetForm)
    case webScrapeRequestBodyOneInstructionsItemGetPage(WebScrapeRequestBodyOneInstructionsItemGetPage)
    case webScrapeRequestBodyOneInstructionsItemPostForm(WebScrapeRequestBodyOneInstructionsItemPostForm)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(WebScrapeRequestBodyOneInstructionsItemExtract.self) {
            self = .webScrapeRequestBodyOneInstructionsItemExtract(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyOneInstructionsItemGetForm.self) {
            self = .webScrapeRequestBodyOneInstructionsItemGetForm(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyOneInstructionsItemGetPage.self) {
            self = .webScrapeRequestBodyOneInstructionsItemGetPage(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyOneInstructionsItemPostForm.self) {
            self = .webScrapeRequestBodyOneInstructionsItemPostForm(value)
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
        case .webScrapeRequestBodyOneInstructionsItemExtract(let value):
            try container.encode(value)
        case .webScrapeRequestBodyOneInstructionsItemGetForm(let value):
            try container.encode(value)
        case .webScrapeRequestBodyOneInstructionsItemGetPage(let value):
            try container.encode(value)
        case .webScrapeRequestBodyOneInstructionsItemPostForm(let value):
            try container.encode(value)
        }
    }
}