//
//  Article.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import Foundation
import SwiftyJSON

struct NewsArticle {
    let id: Int
    let title: String
    let authors: [Author]
    let url: String
    let imageUrl: String
    let newsSite: String
    let summary: String
    let publishedAt: String
    let updatedAt: String
    let featured: Bool
    let launches: [Launch]
    let events: [Event]

    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        authors = json["authors"].arrayValue.map { Author(json: $0) }
        url = json["url"].stringValue
        imageUrl = json["image_url"].stringValue
        newsSite = json["news_site"].stringValue
        summary = json["summary"].stringValue
        publishedAt = json["published_at"].stringValue
        updatedAt = json["updated_at"].stringValue
        featured = json["featured"].boolValue
        launches = json["launches"].arrayValue.map { Launch(json: $0) }
        events = json["events"].arrayValue.map { Event(json: $0) }
    }
}

struct Author {
    let name: String
    let socials: Socials

    init(json: JSON) {
        name = json["name"].stringValue
        socials = Socials(json: json["socials"])
    }
}

struct Socials {
    let x: String
    let youtube: String
    let instagram: String
    let linkedin: String
    let mastodon: String
    let bluesky: String

    init(json: JSON) {
        x = json["x"].stringValue
        youtube = json["youtube"].stringValue
        instagram = json["instagram"].stringValue
        linkedin = json["linkedin"].stringValue
        mastodon = json["mastodon"].stringValue
        bluesky = json["bluesky"].stringValue
    }
}

struct Launch {
    let launchId: String
    let provider: String

    init(json: JSON) {
        launchId = json["launch_id"].stringValue
        provider = json["provider"].stringValue
    }
}

struct Event {
    let eventId: Int
    let provider: String

    init(json: JSON) {
        eventId = json["event_id"].intValue
        provider = json["provider"].stringValue
    }
}
