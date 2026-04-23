//
//  Resource.swift
//  CollegeSuccessToolkit3
//
// 
//
import Foundation

//ENUM
enum ResourceType {
    case academic
    case health
    case career
}


struct Resource {
    let title: String
    let summary: String
    let url: String
    let type: ResourceType
}
