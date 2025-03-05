//
//  ViewModel.swift
//  IOSDeveloperAssignmentLevelSupermind
//
//  Created by Aditya chauhan on 28/02/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var recommendedMeditations: [Model] = [
        Model(title: "Freedom Series", subtitle: "Meditation · 10 Mins", author: "Akhil Aryan", duration: "10 Mins", imageName: "IMG-3", isNew: false),
        Model(title: "Freedom Series", subtitle: "Meditation Series", author: "Akhil Aryan", duration: "15 Mins", imageName: "IMG-5", isNew: true)
    ]
    
    @Published var recentMeditations: [Model] = [
        Model(title: "Freedom Series", subtitle: "Meditation · 10 Mins", author: "Akhil Aryan", duration: "10 Mins", imageName: "IMG-3", isNew: false),
        Model(title: "Freedom Series", subtitle: "Meditation Series", author: "Akhil Aryan", duration: "15 Mins", imageName: "IMG-5", isNew: true)
    ]
    
    @Published var featuredMeditation: Model = Model(
        title: "Change your thought patterns",
        subtitle: "Meditation Series",
        author: "Ranveer Allahbadia",
        duration: "10 Mins",
        imageName: "Featured1",
        isNew: false
    )
}
