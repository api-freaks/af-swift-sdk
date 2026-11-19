import Foundation

/// Set the output format. `json` returns metadata with a hosted file URL. `image` streams the raw file bytes directly.
public enum BulkScreenshotCaptureRequestUrlsItemOutput: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case image
}