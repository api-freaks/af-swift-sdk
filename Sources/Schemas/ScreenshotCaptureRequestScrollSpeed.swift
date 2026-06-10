import Foundation

public enum ScreenshotCaptureRequestScrollSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case normal
    case fast
    case slow
}