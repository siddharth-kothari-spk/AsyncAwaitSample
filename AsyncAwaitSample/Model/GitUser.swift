//
//  GitUser.swift
//  AsyncAwaitSample
//
//  Created by Siddharth Kothari on 28/06/23.
//

import Foundation

struct GitUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

enum GitUserError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
/*
 {
   "login": "siddharth-kothari-spk",
   "id": 126535491,
   "node_id": "U_kgDOB4rHQw",
   "avatar_url": "https://avatars.githubusercontent.com/u/126535491?v=4",
   "gravatar_id": "",
   "url": "https://api.github.com/users/siddharth-kothari-spk",
   "html_url": "https://github.com/siddharth-kothari-spk",
   "followers_url": "https://api.github.com/users/siddharth-kothari-spk/followers",
   "following_url": "https://api.github.com/users/siddharth-kothari-spk/following{/other_user}",
   "gists_url": "https://api.github.com/users/siddharth-kothari-spk/gists{/gist_id}",
   "starred_url": "https://api.github.com/users/siddharth-kothari-spk/starred{/owner}{/repo}",
   "subscriptions_url": "https://api.github.com/users/siddharth-kothari-spk/subscriptions",
   "organizations_url": "https://api.github.com/users/siddharth-kothari-spk/orgs",
   "repos_url": "https://api.github.com/users/siddharth-kothari-spk/repos",
   "events_url": "https://api.github.com/users/siddharth-kothari-spk/events{/privacy}",
   "received_events_url": "https://api.github.com/users/siddharth-kothari-spk/received_events",
   "type": "User",
   "site_admin": false,
   "name": null,
   "company": null,
   "blog": "",
   "location": null,
   "email": null,
   "hireable": null,
   "bio": "iOS developer.",
   "twitter_username": null,
   "public_repos": 18,
   "public_gists": 0,
   "followers": 0,
   "following": 3,
   "created_at": "2023-02-28T02:13:50Z",
   "updated_at": "2023-05-24T10:50:26Z"
 }
 */
