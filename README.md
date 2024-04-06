# TweetSense

# Sentiment Analysis Of Twitter Data Using CoreML and CreateML On iOS

## Overview

This iOS application leverages CreateML's Natural Language Processing (NLP) capabilities to track and understand public sentiments on specific topics with high accuracy. The app integrates SwiftUI for intuitive data visualization, providing users with reliable insights into tweet sentiments in real-time. Firebase Authentication is implemented for user authentication, ensuring secure access to the application's features.

## Features

- **Tweet Classifier**: Visualizes sentiment distribution (positive, negative, neutral) using pie and bar charts, accompanied by the respective tweets.
- **Text Sentiment Analysis**: Predicts the sentiment (positive, neutral, negative) of input text.

## Dataset

The application utilizes the "Apple Tweets" dataset sourced from Kaggle, containing tweets related to Apple. This dataset is used to train the sentiment analysis model.

## Authentication

Firebase Authentication is employed to manage user authentication securely. Users are required to sign in to access the app's functionalities.

## Sections

### 1. Tweet Classifier

This section provides visualizations of sentiment distribution within the Twitter data. Users can observe the proportion of positive, negative, and neutral sentiments through pie and bar charts. Additionally, the corresponding tweets are displayed for further context.

### 2. Text Sentiment Analysis

In this section, users can input text, and the application predicts its sentiment as positive, neutral, or negative using the trained model.

## Technologies Used

- CreateML: Utilized for Natural Language Processing tasks, including sentiment analysis.
- SwiftUI: Employed for building the user interface, ensuring a smooth and intuitive user experience.
- Firebase Authentication: Integrated for secure user authentication.
- Kaggle Dataset: Utilized the "Apple Tweets" dataset for training the sentiment analysis model.

## Future Enhancements

- Real-time sentiment tracking: Implementing features to continuously monitor sentiments on specific topics.
- Enhanced visualization options: Providing users with more customizable visualization tools for deeper insights.
- Multi-language support: Expanding sentiment analysis capabilities to include multiple languages for broader usability.

## Setup Instructions

1. Clone the repository to your local machine.
2. Install necessary dependencies using CocoaPods or Swift Package Manager.
3. Set up Firebase Authentication and replace the provided credentials with your own.
4. Train the sentiment analysis model using the provided dataset or a custom dataset.
5. Run the application on a simulator or a physical iOS device.

## Acknowledgments

- Kaggle for providing the "Apple Tweets" dataset.
- Firebase for offering secure authentication services.
- Apple for the SwiftUI framework and CreateML for NLP capabilities.
