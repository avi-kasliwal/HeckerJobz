//
//  ContentView.swift
//  HeckerJobz
//
//  Created by Avi Kasliwal on 11/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.jobs) { job in
                NavigationLink (destination: DetailView (text: job.text ?? "", url: job.url ?? "")) {
                    VStack (alignment: .leading) {
                        Text (job.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .padding([.top, .bottom], 5)
                        HStack {
                            Text ("\(Date (timeIntervalSince1970: TimeInterval(job.time)).formatted (Date.FormatStyle ().day ().month ().year ()))")
                                .foregroundColor(.gray)
                            Spacer ()
                            Text ("- \(job.by)")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("Hecker Jobz")
            .padding(.top)
        }
        .onAppear() {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12")
                .previewInterfaceOrientation(.portrait)
        }
    }
}

