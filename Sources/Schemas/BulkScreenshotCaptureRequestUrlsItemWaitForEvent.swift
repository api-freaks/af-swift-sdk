import Foundation

/// Controls when rendering starts based on page load lifecycle. `load` (all resources), `domcontentloaded` (HTML parsed), `networkidle` (no network activity for 500ms).
public enum BulkScreenshotCaptureRequestUrlsItemWaitForEvent: String, Codable, Hashable, CaseIterable, Sendable {
    case load
    case domcontentloaded
    case networkidle
}