# Jaspr Portfolio

> A portfolio website made with Jaspr!

[![Build](https://img.shields.io/github/actions/workflow/status/siesdart/jaspr-portfolio/fly.yml)](https://github.com/siesdart/jaspr-portfolio/actions/workflows/fly.yml) [![License](https://img.shields.io/github/license/siesdart/jaspr-portfolio?color=blue)](https://github.com/siesdart/jaspr-portfolio/blob/main/LICENSE) ![GitHub stars](https://img.shields.io/github/stars/siesdart/jaspr-portfolio?style=flat&label=stars&labelColor=333940&color=8957e5&logo=github) [![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg)](https://github.com/invertase/melos) [![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

The demo: **[click here](https://siesdart.fly.dev/)**

## Prerequisites 📋

```bash
# Activate Melos
dart pub global activate melos

# Activate Jaspr CLI
dart pub global activate jaspr_cli
```

## How to Use 🔧

```bash
# Initialize the workspace
melos bootstrap

# Start the development server
melos serve
```

## Deployment 📦

```bash
# Build the website
melos build

# Deploy to fly.io (flyctl needed)
flyctl deploy --remote-only
```

## Technologies used 🛠️

- [Jaspr](https://github.com/schultek/jaspr) - Web framework
- [Melos](https://pub.dev/packages/melos) - Monorepo tool
- [Tailwind CSS](https://tailwindcss.com/) - CSS framework
- [Markdown](https://pub.dev/packages/markdown) - Dart Markdown library
- [Pdf](https://pub.dev/packages/pdf) - Dart Pdf library
