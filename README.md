# Rails 4.2 Legacy Application - Modern Container Setup

This project demonstrates how to run a legacy Rails 4.2 application in a modern container environment using Docker/Podman and VS Code devcontainers.

## Project Overview

- **App Location**: `/src` directory
- **Rails Version**: 4.2.11.3
- **Ruby Version**: 2.7.8
- **Implementation**: Based on the [Rails 4.2 Getting Started Guide](https://guides.rubyonrails.org/v4.2/getting_started.html)

## Container Setup

This project uses modern containerization approaches to isolate the legacy Rails environment:

- **Development Container**: VS Code devcontainer configuration for seamless development
- **Volume Mounts**: Code is mounted from the host to enable real-time editing
- **Production Container**: Lightweight Docker/Podman image for deployment
- **Automatic Server**: Rails server starts automatically in all container configurations

## Code Quality Tools

This project includes industry-standard code quality tools to ensure maintainable and consistent code:

- **RuboCop**: Enforces Ruby style guidelines and best practices
  - Configured with Ruby 2.7 compatibility
  - Includes Rails-specific rules via rubocop-rails plugin
  - Style guides aligned with https://rubystyle.guide and https://rails.rubystyle.guide

- **Solargraph**: Provides intelligent code completion and documentation
  - Enhanced Rails support via solargraph-rails plugin
  - Integrated with RuboCop for consistent style checking

Both tools are installed and configured in the development container for seamless integration with your workflow.

## Getting Started

### Using VS Code Devcontainer

1. Open the project in VS Code with the Dev Containers extension installed
2. VS Code will prompt to "Reopen in Container" - accept this prompt
3. The Rails server starts automatically when the container is ready
4. Access the application at http://localhost:3000

### Using Docker/Podman Directly

1. Build and start the containers:
   ```
   docker-compose up -d
   ```
2. The Rails server automatically starts as part of the container startup process
3. Access the application at http://localhost:3000

## Authentication

Some actions in the application are protected by HTTP Basic Authentication:

- **Username**: dhh
- **Password**: secret

You will be prompted for these credentials when accessing protected areas of the application.

## Dependencies

For legacy Rails 4.2 compatibility, specific gem versions are required:

```
gem 'sqlite3', '~> 1.3.0'
gem 'bigdecimal', '1.4.4'
```

Use bundler 1.17.3 for compatibility:
```
bundle _1.17.3_ install
```
