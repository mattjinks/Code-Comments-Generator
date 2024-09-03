# Code Comment Generator

Code Comment Generator is a project that integrates OpenAI’s GPT-4 model into a Ruby on Rails API to generate comments for code snippets in real time. This project demonstrates the potential of AI-driven tools in software development, offering a solution that enhances code readability and maintainability by automating the process of adding comments.

## Demo: https://youtu.be/F7hT0tjAkJw?si=aJperXFRC8K2KO3S

## Blog: https://medium.com/@mattjinks/code-comment-generator-with-ruby-on-rails-and-openai-0bce18bab911

## Project Overview:

1\. The project consists of two main components:

2\. Rails API: A backend service built with Ruby on Rails that uses OpenAI's GPT-4 model to generate comments for code snippets provided by users. Ruby Client Application: A separate Ruby application that interacts with the Rails API, allowing users to submit code snippets and receive AI-generated comments in real-time.

## Features:

**- Real-Time Comment Generation:** Leverages OpenAI's GPT-4 model to generate code comments dynamically as users input code.

**- Streaming Responses:** The Rails API streams responses in real-time, providing immediate feedback to the client.

**- Modular Design:** The API is designed to be easily integrated into other applications or extended with additional functionality.

## Running the API:
To start the Rails API, navigate to the code_comment_generator_api directory and run:
```bash
rails s
```
This will start the API server at http://localhost:3000.

## Running the Client:
To start the Client App, navigate to the code_comment_generator_client directory and run:
```bash
rails s
```
This client server is configured to listen at http://localhost:4567.

The client app should look something like this:

![enter image description here](codegeneratorscreenshot.png)

If you want to test the API without using the client app send a POST request to the /comment endpoint with the following JSON payload:

```
{
  "code": "String s = "Hello World!"
}
```

The API will respond with a stream of comments generated for the provided code snippet.