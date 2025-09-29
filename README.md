# Jaspr Portfolio

> A modern, content-driven portfolio website built with [Jaspr](https://jaspr.site/) and structured as a Dart monorepo.

[![Build](https://img.shields.io/github/actions/workflow/status/siesdart/jaspr-portfolio/fly.yml)](https://github.com/siesdart/jaspr-portfolio/actions/workflows/fly.yml) [![License](https://img.shields.io/github/license/siesdart/jaspr-portfolio?color=blue)](https://github.com/siesdart/jaspr-portfolio/blob/main/LICENSE) ![GitHub stars](https://img.shields.io/github/stars/siesdart/jaspr-portfolio?style=flat&label=stars&labelColor=333940&color=8957e5&logo=github) [![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg)](https://github.com/invertase/melos) [![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

This project is a personal portfolio website designed to be clean, scalable, and easy to maintain. It leverages the power of the Jaspr framework for building static sites with Dart and is organized as a monorepo using Melos.

**Live Demo: [siesdart.fly.dev](https://siesdart.fly.dev/)**

---

## ✨ Features

- **Monorepo Architecture**: The project is organized as a monorepo using [Melos](https://melos.invertase.dev/), which simplifies dependency management and script execution across multiple packages.
- **Content-Driven**: Portfolio content such as projects, experiences, and skills are managed through simple Markdown and YAML files, allowing for easy updates without touching the Dart source code.
- **PDF Resume Generation**: Includes a feature to dynamically generate a downloadable PDF version of the resume from the same content source.
- **Reusable UI Components**: A dedicated `ui` package provides a library of reusable components, ensuring a consistent design system across the application.
- **Clean Architecture**: Follows a clean architecture with a clear separation of concerns between data models (`core`), features (`features/*`), UI components (`ui`), and the main application (`apps/portfolio`).

## 📂 Project Structure

The project is a monorepo with the following structure:

```
.
├── apps
│   └── portfolio/      # The main Jaspr web application
├── packages
│   ├── core/           # Core data models and business logic
│   ├── features
│   │   └── resume/     # Logic for PDF resume generation
│   └── ui/             # Reusable UI components
└── melos.yaml          # Melos workspace configuration
```

## 🛠️ Technologies Used

- **Framework**: [Jaspr](https://jaspr.site/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Jaspr Riverpod](https://pub.dev/packages/jaspr_riverpod)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/)
- **Monorepo Management**: [Melos](https://melos.invertase.dev/)
- **Data Serialization**: [dart_mappable](https://pub.dev/packages/dart_mappable)
- **PDF Generation**: [pdf](https://pub.dev/packages/pdf)

## 🚀 Getting Started

### Prerequisites

Make sure you have the Dart SDK installed. Then, activate the following CLI tools:

```bash
# Activate Melos for monorepo management
dart pub global activate melos

# Activate the Jaspr CLI
dart pub global activate jaspr_cli
```

### Running the Project

1.  **Bootstrap the workspace:**
    This command installs all dependencies for the root project and all packages.
    ```bash
    melos bootstrap
    ```

2.  **Start the development server:**
    This command starts the Jaspr development server with hot-reloading enabled.
    ```bash
    melos serve
    ```

## 📦 Build and Deployment

### Build

To build the application for production (generates a static site in `apps/portfolio/build/web`), run:

```bash
melos build
```

### Deployment

This project is configured for deployment on [Fly.io](https://fly.io/). Once you have the `flyctl` CLI installed and configured, you can deploy with:

```bash
flyctl deploy --remote-only
```

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.