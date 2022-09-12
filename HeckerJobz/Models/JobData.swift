//
//  JobData.swift
//  HeckerJobz
//
//  Created by Avi Kasliwal on 12/09/22.
//

import Foundation

struct JobData: Decodable, Identifiable {
    let by: String
    let id: Int
    let time: Int
    let title: String
    let url: String?
    let text: String?
}
