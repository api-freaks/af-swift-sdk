import Foundation

public enum ScreenshotCaptureRequestWaitForEvent: String, Codable, Hashable, CaseIterable, Sendable {
    case load
    case domcontentloaded
    case networkidle
}