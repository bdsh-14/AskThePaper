# AskThePaper

A macOS/iOS application that allows you to ask questions about documents using AI-powered natural language processing.

## Overview

**AskThePaper** is a Swift-based application that enables users to interact with documents through an intelligent chat interface. Simply drop a PDF or text file into the app, and start asking questions about its contents. The app uses Apple's LanguageModelSession to provide intelligent responses about your documents.

## Features

- 📄 **Drag & Drop Support**: Easily upload PDF and text files by dragging them into the app
- 💬 **Chat Interface**: Intuitive conversation-style interface to ask questions about your documents
- 🤖 **AI-Powered Responses**: Uses Apple's Foundation Models for intelligent document analysis
- ⚡ **Auto-Summarization**: Automatically generates a 3-5 sentence summary when you load a document
- ⏳ **Visual Feedback**: Animated typing indicator shows when the AI is processing your question
- 📱 **Cross-Platform**: Built with SwiftUI for seamless experience across macOS and iOS

## Supported File Types

- **PDF** (. pdf) - Extracts text from PDF documents
- **Plain Text** (.txt) - Reads raw text files
- **Images** (.png, .jpeg) - Can process image content

## Getting Started

### Requirements

- Xcode 15+
- iOS 18+ / macOS 15+
- Swift 6.0+
- Apple's FoundationModels framework

### Installation

1. Clone the repository:
```bash
git clone https://github.com/bdsh-14/AskThePaper. git
cd AskThePaper
```
2. Open the project in Xcode.
3. Build and run: Select your target device, Press `Cmd + R` to build and run.
