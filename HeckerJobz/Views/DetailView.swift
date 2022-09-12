//
//  DetailView.swift
//  HeckerJobz
//
//  Created by Avi Kasliwal on 12/09/22.
//

import SwiftUI

struct DetailView: View {
    var text: String
    var url: String
    
    var body: some View {
        WebView(text: text, url: url)
    }
}
