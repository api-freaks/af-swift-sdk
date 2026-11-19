import Foundation

/// CSS media type used to render the PDF: print or screen.
public enum BulkScreenshotCaptureRequestUrlsItemPdfOptionsMedia: String, Codable, Hashable, CaseIterable, Sendable {
    case print
    case screen
}