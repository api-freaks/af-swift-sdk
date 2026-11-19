import Foundation

/// PDF output options. Applies when file_type is PDF.
public struct BulkScreenshotCaptureRequestUrlsItemPdfOptions: Codable, Hashable, Sendable {
    /// Paper size of the PDF. Applies when file_type is PDF. Without it, width and height are used if set, otherwise the page renders as one long page: A0, A1, A2, A3, A4, A5, A6, Letter, Legal, Tabloid, or Ledger.
    public let format: BulkScreenshotCaptureRequestUrlsItemPdfOptionsFormat?
    /// Renders the PDF in landscape orientation, swapping the width and height of the paper size. Applies when file_type is PDF.
    public let landscape: Bool?
    /// Pages to keep in the PDF, as start-end, for example 1-3 or 5-5. Pages are rendered first and then trimmed. Has no effect on a single-page PDF. Applies when file_type is PDF.
    public let pageRange: String?
    /// CSS media type used to render the PDF: print or screen.
    public let media: BulkScreenshotCaptureRequestUrlsItemPdfOptionsMedia?
    /// Includes background colors and images in the PDF. Applies when file_type is PDF.
    public let printBackground: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        format: BulkScreenshotCaptureRequestUrlsItemPdfOptionsFormat? = nil,
        landscape: Bool? = nil,
        pageRange: String? = nil,
        media: BulkScreenshotCaptureRequestUrlsItemPdfOptionsMedia? = nil,
        printBackground: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.format = format
        self.landscape = landscape
        self.pageRange = pageRange
        self.media = media
        self.printBackground = printBackground
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.format = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemPdfOptionsFormat.self, forKey: .format)
        self.landscape = try container.decodeIfPresent(Bool.self, forKey: .landscape)
        self.pageRange = try container.decodeIfPresent(String.self, forKey: .pageRange)
        self.media = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemPdfOptionsMedia.self, forKey: .media)
        self.printBackground = try container.decodeIfPresent(Bool.self, forKey: .printBackground)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.landscape, forKey: .landscape)
        try container.encodeIfPresent(self.pageRange, forKey: .pageRange)
        try container.encodeIfPresent(self.media, forKey: .media)
        try container.encodeIfPresent(self.printBackground, forKey: .printBackground)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case format
        case landscape
        case pageRange = "page_range"
        case media
        case printBackground = "print_background"
    }
}