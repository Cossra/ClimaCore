# ClimaCore - Advanced CI/CD Pipeline

A .NET 9 minimal API with advanced Azure deployment features including automatic versioning and blue-green deployments using staging slots.

## 🚀 Features

- **Automatic Version Tagging**: Each successful deployment creates a new semantic version tag (v1.0.1, v1.0.2, etc.)
- **Zero-Downtime Deployments**: Deploy to staging slot first, then swap to production
- **Health Checks**: Automated testing before production swap
- **GitHub Releases**: Automatic release notes with deployment details
- **Rollback Capability**: Easy rollback using git tags and Azure slot swaps

## 🔧 Setup Instructions

### 1. Initial Setup (One-time)

#### Create Azure Staging Slot
Run the setup script to create a staging deployment slot:

```bash
chmod +x scripts/setup-staging.sh
./scripts/setup-staging.sh
```

Or manually using Azure CLI:
```bash
az webapp deployment slot create \
  --name climacore-robert \
  --resource-group rg-climacore \
  --slot staging
```

#### Configure GitHub Secrets
Add these secrets to your GitHub repository (Settings → Secrets and variables → Actions):

1. **AZURE_WEBAPP_PUBLISH_PROFILE_STAGING**
   - Go to Azure Portal → Your Web App → Deployment slots → staging
   - Click "Get publish profile"
   - Copy the entire XML content

2. **AZURE_WEBAPP_PUBLISH_PROFILE** (for production - if using publish profile method)
   - Go to Azure Portal → Your Web App → Overview
   - Click "Get publish profile"
   - Copy the entire XML content

### 2. Deployment Workflow

The GitHub Actions workflow (`azure-deploy.yml`) automatically:

1. **Builds** the .NET application
2. **Calculates** next semantic version (v1.0.x)
3. **Deploys** to staging slot
4. **Health checks** staging deployment
5. **Swaps** staging → production (zero downtime!)
6. **Verifies** production deployment
7. **Creates** git tag and GitHub release

## 🌐 URLs

- **Production**: https://climacore-robert.azurewebsites.net
- **Staging**: https://climacore-robert-staging.azurewebsites.net
- **API Endpoint**: `/weatherforecast`

## 📋 Manual Operations

### Rollback to Previous Version

#### Option 1: Swap slots back
```bash
az webapp deployment slot swap \
  --name climacore-robert \
  --resource-group rg-climacore \
  --slot production \
  --target-slot staging
```

#### Option 2: Deploy specific version
```bash
# List available versions
git tag -l

# Deploy specific version (replace v1.0.5 with desired version)
git checkout v1.0.5
# Then push to trigger deployment or use Azure CLI
```

### Manual Health Check
```bash
# Test staging
curl https://climacore-robert-staging.azurewebsites.net/weatherforecast

# Test production
curl https://climacore-robert.azurewebsites.net/weatherforecast
```

### View Deployment Logs
- GitHub: Actions tab → Latest workflow run
- Azure: App Service → Deployment Center → Logs

## 🔄 Version Management

### Automatic Versioning
- **Patch versions** (1.0.x) are automatically incremented for each deployment
- **Minor/Major versions** can be manually set by creating a tag:

```bash
# To bump to v1.1.0 (minor version)
git tag v1.1.0
git push origin v1.1.0

# Next auto-deployment will be v1.1.1, v1.1.2, etc.
```

### Manual Version Override
```bash
# Create a specific version tag
git tag -a v2.0.0 -m "Major release: Breaking API changes"
git push origin v2.0.0
```

## 🛠️ Troubleshooting

### Deployment Fails at Health Check
1. Check staging logs in Azure portal
2. Test staging URL manually
3. Check application startup issues

### Staging Slot Not Found
```bash
# Recreate staging slot
az webapp deployment slot create \
  --name climacore-robert \
  --resource-group rg-climacore \
  --slot staging
```

### GitHub Actions Secrets Issues
1. Verify secrets are correctly set in GitHub repository settings
2. Download fresh publish profiles from Azure portal
3. Ensure no extra whitespace in secret values

## 📈 Production Best Practices

- **Monitor** both slots during and after deployments
- **Set up** Application Insights for detailed monitoring
- **Configure** custom health check endpoints
- **Use** slot-specific configuration for different environments
- **Test** rollback procedures regularly

## 🎯 Next Steps

Consider adding:
- **Integration tests** that run against staging before swap
- **Performance tests** to catch regressions
- **Database migrations** handling for slot swaps
- **Custom health check endpoints** beyond the basic API test
- **Slack/Teams notifications** for deployment status