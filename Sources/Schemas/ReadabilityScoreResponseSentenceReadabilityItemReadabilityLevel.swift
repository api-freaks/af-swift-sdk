import Foundation

/// Difficulty level for the sentence based on the target audience
public enum ReadabilityScoreResponseSentenceReadabilityItemReadabilityLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case veryEasy = "Very Easy"
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    case veryHard = "Very Hard"
}