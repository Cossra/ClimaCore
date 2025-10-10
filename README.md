# HelloAzureAPI 🚀  
[![Build Status](https://github.com/Cossra/HelloAzureAPI/actions/workflows/azure-deploy.yml/badge.svg)](https://github.com/Cossra/HelloAzureAPI/actions/workflows/azure-deploy.yml)
![Infrastructure as Code](https://img.shields.io/badge/Infra-as--Code-success?logo=azuredevops&logoColor=white)
![Azure](https://img.shields.io/badge/Hosted%20on-Azure%20App%20Service-blue?logo=microsoftazure&logoColor=white)

A **cloud-native REST API** built with **.NET 9** and deployed via automated CI/CD pipelines using **GitHub Actions** and the **Azure CLI**.  
Implements **infrastructure as code**, versioned deployments, and production-ready observability for a realistic enterprise backend.

🌐 **Live Demo:** [https://helloazure-robert.azurewebsites.net](https://helloazure-robert.azurewebsites.net)

---

## 🧠 Overview  
Built with .NET 9 and deployed to Azure App Service, this project delivers a production-grade REST API with OpenAPI/Swagger documentation, health monitoring, semantic versioning, and environment-specific configuration. CI/CD automation is handled through GitHub Actions and Azure CLI. The headless front end connects directly to Azure endpoints using React 18, TypeScript, and Tailwind CSS, forming a fast, modular, and modern full-stack web application.

---

## 🔒 Security Note
Swagger UI is intentionally enabled in production for this portfolio project to allow easy API testing and demonstration. In a real-world application with sensitive data, Swagger would typically be restricted to development environments only.

---

## 🧩 Agile User Story
As a user
I Want to check free, real-time weather updates online
SO That I can quickly see current conditions wherever I am

---

## ⚙️ Tech Stack  
- .NET 9 (STS)  
- C#  
- Azure App Service  
- Azure CLI  
- GitHub Actions  
- Linux Hosting (App Service Plan)

---

## 🧩 Local Development  

```bash
dotnet restore
dotnet run

---

Happy Coding!

---
