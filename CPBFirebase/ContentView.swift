//
//  ContentView.swift
//  CPBFirebase
//
//  Created by Calvin Rice on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CollegeViewModel
    var addAlert: Bool
    var addName: String
    var addLocation: String
    var addPopulation: Int
    var addURL: String
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.collegeList) { college in
                    CollegeListItem(college: college)
                }
            }
            .alert("Add College", isPresented: $addAlert) {
                
                Button("Add") {
                    viewModel.AddCollege(currentCollege: College(name: addName, location: addLocation, population: addPopulation, URL: addURL))
                    viewModel.PullFromFirebase()
                    addName = ""
                    addLocation = ""
                    addPopulation = 0
                    addURL = ""
                    addAlert = false
                }
                Button("Cancel") {
                    addName = ""
                    addLocation = ""
                    addPopulation = 0
                    addURL = ""
                    addAlert = false
                }
                TextField("College Name", text: $addName)
                TextField("Location", text: $addLocation)
                TextField("Student Population", text: $addPopulation)
                TextField("Website URL", text: $addURL)
            }
        }
        .padding()
        .onAppear(perform: {
            viewModel.PullFromFirebase()
        })
    }
    
}

#Preview {
    ContentView()
}
