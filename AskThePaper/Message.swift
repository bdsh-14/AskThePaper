//
//  Message.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/6/25.
//

import Foundation

struct Message: Equatable, Identifiable {
	var id = UUID().uuidString
	var text: String
	var isAI: Bool
	var timeStamp: Date = .now
}
