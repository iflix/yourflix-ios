import Foundation

struct Movie {
    let id: Int
    let vimondId: Int
    let categoryId: String
    let categoryName: String
    let title: String
    let description: String
    let synopsis: String
    let imageUrl: String
    let imagePackId: String
    let createTime: String
    let slug: String
    let playURL: String
    let trailers: [Int]
    let contentStartOffset: Int
    let contentEndOffset: Int
    let expireDate: String

    enum JSONKeys: String {
        case id
        case vimondId
        case categoryId
        case categoryName
        case title
        case description
        case synopsis
        case imageUrl
        case imagePackId
        case createTime
        case slug
        case playURL
        case trailers
        case contentStartOffset
        case contentEndOffset
        case expireDate
    }

    init(_ json: [String: Any]) {
        id = json[JSONKeys.id.rawValue] as? Int ?? -1
        vimondId = json[JSONKeys.vimondId.rawValue] as? Int ?? -1
        categoryId = json[JSONKeys.categoryId.rawValue] as? String ?? ""
        categoryName = json[JSONKeys.categoryName.rawValue] as? String ?? ""
        title = json[JSONKeys.title.rawValue] as? String ?? ""
        description = (json[JSONKeys.description.rawValue] as? [String: String])?["en_US"] ?? ""
        synopsis = (json[JSONKeys.synopsis.rawValue] as? [String: String])?["en_US"] ?? ""
        imageUrl = json[JSONKeys.imageUrl.rawValue] as? String ?? ""
        imagePackId = json[JSONKeys.imagePackId.rawValue] as? String ?? ""
        createTime = json[JSONKeys.createTime.rawValue] as? String ?? ""
        slug = json[JSONKeys.slug.rawValue] as? String ?? ""
        playURL = json[JSONKeys.playURL.rawValue] as? String ?? ""
        trailers = json[JSONKeys.trailers.rawValue] as? [Int] ?? []
        contentStartOffset = json[JSONKeys.contentStartOffset.rawValue] as? Int ?? 0
        contentEndOffset = json[JSONKeys.contentEndOffset.rawValue] as? Int ?? 0
        expireDate = json[JSONKeys.expireDate.rawValue] as? String ?? ""
    }
}
