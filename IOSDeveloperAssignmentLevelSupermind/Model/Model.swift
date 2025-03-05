//
//  homeView.swift
//  IOSDeveloperAssignmentLevelSupermind
//
//  Created by Aditya chauhan on 28/02/25.
//

import Foundation

struct Model: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let author: String
    let duration: String
    let imageName: String
    let isNew: Bool
}
