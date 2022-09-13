//
//  NetworkManager.swift
//  HeckerJobz
//
//  Created by Avi Kasliwal on 11/09/22.
//

import Foundation

class NetworkManager : ObservableObject {
    var jobIds = [Int]()
    @Published var jobs = [JobData]()
    
    func fetchJobIds () {
        if let url = URL (string: "https://hacker-news.firebaseio.com/v0/jobstories.json") {
            let session = URLSession (configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let safeData = data {
                        do {
                            let res = try JSONDecoder ().decode([Int].self, from: safeData)
                            DispatchQueue.main.async {
                                self.jobIds = res
                            }
                        } catch {
                            print (error)
                        }
                    }
                } else {
                    print(error!)
                }
            }
            task.resume()
        }
    }
    
    func fetchData () {
        // Get Job IDs
        fetchJobIds()
        
        // Wait for the jobIds array to be populated
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for jobId in self.jobIds {
                if let url = URL (string: "https://hacker-news.firebaseio.com/v0/item/\(jobId).json") {
                    let session = URLSession (configuration: .default)
                    let task = session.dataTask(with: url) { data, response, error in
                        if error == nil {
                            if let safeData = data {
                                do {
                                    let result = try JSONDecoder ().decode(JobData.self, from: safeData)
                                    DispatchQueue.main.sync {
                                        self.jobs.insert(result, at: 0)
                                    }
                                } catch {
                                    print ("Error while decoding data for \(jobId) : \(error)")
                                }
                            }
                        } else {
                            print ("Error while fetching data : \(error!)")
                        }
                    }
                    task.resume()
                }
            }
        }
    }
}
