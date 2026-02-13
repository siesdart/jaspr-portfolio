# Gemini Code Assistant Context

This document provides context for the Gemini code assistant to understand the project structure, technologies, and conventions.

## Project Overview

This project is a portfolio website built with the [Jaspr](https://jaspr.site/) framework, a modern web framework for building websites in Dart. The project is structured as a monorepo using [Melos](https://melos.invertase.dev/) to manage packages and dependencies.

The main application, `portfolio`, is located in the `apps` directory. It consumes data from local files (Markdown and YAML) and displays it. The project also includes several packages in the `packages` directory:

- **core**: Contains the data models and core logic for the portfolio.
- **features/resume**: Contains the logic for generating a PDF resume.
- **ui**: Contains reusable UI components.

The portfolio content is stored in the `apps/portfolio/content` directory. This includes information about projects, experiences, skills, and an introduction.

## Technologies Used

- **[Jaspr](https://jaspr.site/):** A modern web framework for building websites in Dart. It supports Single Page Applications (SPAs), Server-Side Rendering (SSR), and Static Site Generation (SSG). An AI-friendly documentation is available at [jaspr.site/llms.txt](https://jaspr.site/llms.txt).
- **[Melos](https://melos.invertase.dev/):** A tool for managing Dart projects with multiple packages, optimizing workflows for monorepos.
- **[Tailwind CSS](https://tailwindcss.com/):** A utility-first CSS framework for rapidly building custom user interfaces.
- **[dart_mappable](https://pub.dev/packages/dart_mappable):** A package for improved JSON serialization and data classes with full support for generics, inheritance, customization, and more.
- **very_good_analysis:** A linting package for Dart and Flutter projects that enforces a strict set of coding standards. (Note: This information could not be verified using the available tools).

## Building and Running

The following commands are used to build and run the project. These are defined in the `melos.yaml` file.

- **Install dependencies:**

  ```bash
  melos bootstrap
  ```

- **Run the development server:**

  ```bash
  melos serve
  ```

- **Build the application for production:**
  ```bash
  melos build
  ```

## Development Conventions

- **Monorepo:** The project is a monorepo, with packages located in the `packages` directory and the main application in the `apps` directory.
- **Data Models:** Data models are defined in the `packages/core` package and use the `dart_mappable` package for serialization.
- **Content Management:** Portfolio content is managed through Markdown and YAML files in the `apps/portfolio/content` directory.
