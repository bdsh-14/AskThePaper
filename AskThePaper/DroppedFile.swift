//
//  DroppedFile.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/6/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct DroppedFile: Transferable {
	let data: Data
	let contentType: UTType

	static var transferRepresentation: some TransferRepresentation {
		DataRepresentation(importedContentType: .pdf) {
			DroppedFile(data: $0, contentType: .pdf)
		}
		DataRepresentation(importedContentType: .png) {
			DroppedFile(data: $0, contentType: .png)
		}
		DataRepresentation(importedContentType: .jpeg) {
			DroppedFile(data: $0, contentType: .jpeg)
		}
		DataRepresentation(importedContentType: .plainText) {
			DroppedFile(data: $0, contentType: .plainText)
		}
	}
}


