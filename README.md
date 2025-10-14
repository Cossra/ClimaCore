# ClimaCore 🚀  

[![Deployed to Azure](https://img.shields.io/badge/Deployed%20to-Azure-blue?logo=microsoftazure&logoColor=white)](https://azure.microsoft.com)
![OpenAPI](https://img.shields.io/badge/Documented%20with-OpenAPI-green?logo=openapiinitiative&logoColor=white)
[![Backend API](https://img.shields.io/badge/Backend%20API-Azure-blue?logo=microsoftazure&logoColor=white)](https://climacoreapi.azurewebsites.net/weatherforecast)
[![Frontend Live](https://img.shields.io/website?url=https%3A%2F%2Fclimacore.cossrobert.com&label=Frontend)](https://climacore.cossrobert.com)

A cloud-native **.NET 9 REST API** built with **C#** and deployed via automated CI/CD pipelines using **GitHub Actions** and the **Azure CLI**, featuring semantic versioning, health monitoring, **OpenAPI documentation (Swagger UI)**, and production-ready observability.

🌐 **Live Demo:** [https://climacore.cossrobert.com](https://climacore.cossrobert.com)  
🧩 **Backend API:** [https://climacore-robert.azurewebsites.net](https://climacore-robert.azurewebsites.net)  
📘 **Swagger UI:** [https://climacoreapi.azurewebsites.net/swagger](https://climacoreapi.azurewebsites.net/swagger)

---

## ☁️ Overview  
This cloud-native API powers the ClimaCore frontend, delivering structured weather data consumed by a **React 18 built with TypeScript & Vite** client hosted on Azure Static Web Apps.  

Built natively for **Azure App Service**, it leverages platform-level scaling, monitoring, and deployment capabilities. Continuous integration and delivery are automated through **GitHub Actions** and **Azure CLI**, ensuring seamless updates and reliable production performance across both environments.

---

## 📘 API Documentation  
Implemented OpenAPI/Swagger-based contract-first design, enabling parallel frontend/backend development and continuous integration testing - UI is intentionally enabled in production for demonstration and portfolio purposes. 

---

## 🧩 Agile User Story  
**As a user**  
**I want** to check free, real-time weather updates online.  
**So that** I can quickly see current conditions wherever I am.

---

## 👨‍💻 Local Development  

```bash
dotnet restore
dotnet run
```

---

## ⚙️ Tech Stack
- .NET 9
- C#
- Azure App Service
- Azure CLI
- GitHub Actions
- Linux Hosting
- React 18 (Headless Front End)
- TypeScript
- Tailwind CSS

---

<p align="center">💻 Happy Coding!</p>


