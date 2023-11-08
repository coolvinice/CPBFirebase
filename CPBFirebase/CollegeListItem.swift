//
//  CollegeListItem.swift
//  CPBFirebase
//
//  Created by Calvin Rice on 11/8/23.
//

import Foundation

struct CollegeListItem: View {
    let college: College
    var body: {
        VStack {
            Text(college.name)
            Text(college.location)
        }
    }
}
