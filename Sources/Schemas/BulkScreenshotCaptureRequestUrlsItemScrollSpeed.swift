import Foundation

/// Scrolling speed: fast, normal (default), or slow. Affects render time and output pacing.
public enum BulkScreenshotCaptureRequestUrlsItemScrollSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case normal
    case fast
    case slow
}