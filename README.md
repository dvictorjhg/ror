# Chuck Norris Facts Finder - Container Setup

This project provides a containerized environment for the Chuck Norris Facts Finder application, which allows users to search for Chuck Norris facts using the [chucknorris.io API](https://api.chucknorris.io/).

## Project Overview

- **App Location**: `/src` directory contains the Rails application
- **Rails Version**: 4.2.11.3
- **Ruby Version**: 2.7.8
- **Features**: Search by text, category, or random facts with email delivery and multilingual support

## Chuck Norris Facts Finder Application

This application was developed to meet the following requirements:
- Search for Chuck Norris facts by text, category, or randomly
- Display paginated results
- Store searches and results in a database
- Allow sending results via email
- Support both Spanish and English languages

For detailed information about the application functionality and screenshots, please see the [application README](/src/README.md).

## Key Gems and Technologies

The application relies on several key gems:

- **HTTParty (0.23.1)**: Used for making HTTP requests to the Chuck Norris API
  - Handles fetching categories, search results, and random facts
  - Simplifies API interactions with a clean, readable syntax
  - Implemented in the `ChuckNorrisApi` service class

- **Kaminari (1.2.2)**: Provides pagination functionality
  - Used to paginate search results (5 items per page)
  - Custom templates in `app/views/kaminari/` for Bootstrap compatibility
  - Enhances user experience when dealing with multiple search results

- **Twilio SendGrid SMTP Relay**: For email delivery of search results
  - Not a Ruby gem but a third-party email delivery service
  - Configuration via environment variables
  - Used in the `FactsMailer` to send search results to users

## Email Configuration (SendGrid)

The application uses the Twilio SendGrid SMTP Relay for email delivery. The `.env` file is already included at `src/.env` - you just need to replace the placeholder values with your actual SendGrid credentials:

```
# MAIL
SENDGRID_API_KEY=your_sendgrid_api_key_here
MAILER_FROM_EMAIL=your_from_email_here
```

**Important**: These values must be updated before building the Docker image or starting the application.

## Container Setup

This project uses Docker to isolate the Rails environment:

- **Development Container**: VS Code devcontainer configuration for seamless development
- **Volume Mounts**: Code is mounted from the host to enable real-time editing
- **Automatic Server**: Rails server starts automatically when the container launches

## Getting Started

### Using VS Code Devcontainer

1. Create a `.env` file with your SendGrid configuration
2. Open the project in VS Code with the Dev Containers extension installed
3. VS Code will prompt to "Reopen in Container" - accept this prompt
4. The Rails server starts automatically when the container is ready
5. Access the application at http://localhost:3000

### Using Docker/Podman Directly

1. Create a `.env` file with your SendGrid configuration
2. Build and start the containers:
   ```
   docker-compose up -d
   ```
3. The Rails server automatically starts as part of the container startup process
4. Access the application at http://localhost:3000

## Screenshots

Screenshots of the application in action are available in the `/screenshots` directory:

### Main Interface
- Main search options page in English
![Search Main Page (English)](screenshots/0_search_main_page_en.png)

- Main search options page in Spanish
![Search Main Page (Spanish)](screenshots/0_search_main_page_es.png)

### Text Search
- Text-based search form in Spanish
![Text Search Form (Spanish)](screenshots/1_0_0_text_search_form_es.png)

- Search results in Spanish
![Text Search Results (Spanish)](screenshots/1_0_1_text_search_result_page_es.png)

- Text search with email input
![Text Search with Email (English)](screenshots/1_1_0_text_search_form_with_email_en.png)

- Results with email sent confirmation and pagination
![Results with Email Notification (English)](screenshots/1_1_1_text_search_result_page_with_email_sent_notification_and_pagination_en.png)

- Email received with text search results
![Text Search Result Email (English)](screenshots/1_1_2_text_search_result_email_en.png)


### Category Search
- Category selection search form
![Category Search Form (English)](screenshots/2_0_0_category_search_form_en.png)

- Results from category search
![Category Search Results (English)](screenshots/2_0_1_category_search_result_page_en.png)


### Random Search
- Random fact search page
![Random Search Form (English)](screenshots/3_0_0_random_search_form_en.png)

- Results from random search
![Random Search Results (English)](screenshots/3_0_1_random_search_result_page_en.png)

- Email received with random fact
![Random Search Result Email (English)](screenshots/3_0_2_random_search_result_email_en.png)


## Dependencies

For legacy Rails 4.2 compatibility, specific gem versions are required:

```
gem 'sqlite3', '~> 1.3.0'
gem 'bigdecimal', '1.4.4'
```
