//
//  Exercise.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-20.
//

import Foundation
struct Exercise {
    let name: String
//    let duration: Int
    let imageURL: String
//    let medical: String
//    let bodyPart: String
//    let catergory: String
    let mode: String
    let recordID: String
//    let goa: String
}
struct ExerciseList {
    let mode: String
    let image:String
    let goal:String
    let bodyPart:String
    let details:String

}
struct ExerciseListOne {
    let name: String
    let image:String
    let recordID: String
    let details: String
    let mode:String
    let duration:String
    let bodyPart:String
    let goal:String
    let catergory:String
}
struct Videos{
    //let documentID:String
    let video:String
}
struct Data{
    //let documentID:String
    let name:String
}
struct schedule{
    //let documentID:String
    let name:String
    let time:String
    let date:String
}
struct ExerciseData{
    //let documentID:String
    let name:String
    let image:String
    let recordID:String
}
struct ExercisData{
    //let documentID:String
    let name:String
    let image:String
    let recordID:String
    let duration:String
}
