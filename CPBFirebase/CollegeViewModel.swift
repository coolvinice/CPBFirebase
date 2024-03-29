//
//  CollegeViewModel.swift
//  CPBFirebase
//
//  Created by Calvin Rice on 11/6/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class CollegeViewModel: ObservableObject {
    @Published var collegeList: [College] = []
    
    init() {
            PullFromFirebase()
        }
        
        func AddCollege(currentCollege: College) {
            collegeList.append(currentCollege)
            AddToFirebase(college: currentCollege)
        }
        
        func AddToFirebase(college: College) {
            let database = Database.database().reference()
            database.child("Colleges").child(college.name).child("Location").setValue(college.location)
            database.child("Colleges").child(college.name).child("Population").setValue(college.population)
            database.child("Colleges").child(college.name).child("URL").setValue(college.URL)
        }
        
        func PullFromFirebase() {
            var database = Database.database().reference()
            database.getData { myError, mySnapshot in
                var newList: [College] = []
                for college in mySnapshot?.children.allObjects as! [DataSnapshot] {
                    var collegeName = college.key
                    var dictionary = college.value as! [String:Any]
                    guard let location  = dictionary["Location"] else { return }
                    guard let population  = dictionary["Population"] else { return }
                    guard let URL  = dictionary["URL"] else { return }
                    
                    newList.append(College(name: collegeName, location: location as! String, population: population as! Int, URL: population as! String))
                }
            }
        }}
