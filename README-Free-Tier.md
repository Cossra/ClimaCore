# ClimaCore - Free Tier CI/CD Pipeline

A .NET 9 minimal API with CI/CD pipeline optimized for Azure Free Tier limitations.

## 🚀 Features (Free Tier Compatible)

- ✅ **Automatic Version Tagging**: Each successful deployment creates a new semantic version tag (v1.0.1, v1.0.2, etc.)
- ✅ **GitHub Releases**: Automatic release notes with deployment details  
- ✅ **Health Checks**: Automated testing after deployment
- ✅ **Rollback Capability**: Easy rollback using git tags
- ❌ **Zero-Downtime Deployments**: Requires Standard tier ($$$) - not available on Free tier
- ❌ **Staging Slots**: Requires Standard tier ($$$) - not available on Free tier

## 💡 Free Tier Strategy

Since Azure Free Tier doesn't support deployment slots, our approach:

1. **Deploy directly to production** with robust health checks
2. **Use git tags for rollbacks** if deployment fails
3. **Minimize downtime** with quick deployments and health verification
4. **Keep automatic versioning** for easy tracking

## 🔧 Setup Instructions

### GitHub Secrets Required
Add this secret to your GitHub repository (Settings → Secrets and variables → Actions):

**AZURE_WEBAPP_PUBLISH_PROFILE**
- Go to Azure Portal → Your Web App → Overview  
- Click "Get publish profile"
- Copy the entire XML content and paste as secret value

- **Production**: https://climacore-robert.azurewebsites.net
- **API Endpoint**: `/weatherforecast`

## 🔄 How the Pipeline Works

1. **Builds** your .NET application
2. **Calculates** next version number (v1.0.x)  
3. **Deploys** directly to production
4. **Waits** 45 seconds for deployment to stabilize
5. **Health checks** the deployed API (6 attempts over 90 seconds)
6. **Verifies** API responses are correct
7. **Creates** git tag and GitHub release

## 📋 Manual Rollback (If Needed)

If a deployment fails or has issues:

### Option 1: Quick Rollback via Git
```bash
# See available versions
git tag -l

# Checkout previous version and redeploy
git checkout v1.0.5  # Replace with previous working version
git checkout -b hotfix-rollback
git push origin hotfix-rollback

# Or force push to main (be careful!)
git checkout v1.0.5
git checkout main
git reset --hard v1.0.5
git push origin main --force
```

### Option 2: Azure Portal Rollback
1. Go to Azure Portal → Your Web App → Deployment Center
2. Find the previous successful deployment
3. Click "Redeploy"

### Option 3: Manual Re-deploy
```bash
# Build and deploy manually using Azure CLI
dotnet publish -c Release -o ./publish
az webapp deployment source config-zip \
  --resource-group rg-climacore \
  --name climacore-robert \
  --src ./publish.zip
```

## 🛠️ Troubleshooting

### Deployment Succeeds but Health Check Fails
- **Wait longer**: Sometimes Azure takes time to update
- **Check logs**: Azure Portal → Your App → Log stream
- **Manual test**: Visit the URL in browser
- **Common issue**: Cold start delays on Free tier

### Version Tagging Issues
```bash
# If tags get out of sync, reset to specific version:
git tag v1.1.0  # Set desired next version
git push origin v1.1.0
```

### Free Tier Limitations
- **Cold starts**: App sleeps after 20 minutes of inactivity
- **No custom domains**: Stuck with `.azurewebsites.net`
- **Limited compute**: Slower than paid tiers
- **No SSL certificates**: HTTPS works but limited control
- **No deployment slots**: Direct production deployment only

## ⚡ Performance Tips for Free Tier

1. **Keep app warm**: Use a ping service to hit your app every 15 minutes
2. **Optimize startup**: Minimize dependencies and startup code
3. **Use async/await**: Important for the limited compute resources
4. **Monitor performance**: Use Application Insights (also has a free tier)

## 🎯 Upgrade Path (When Ready)

When you're ready to invest in paid hosting:

**Basic B1 (~$13/month):**
- Always-on (no cold starts)
- Custom domains
- Better performance

**Standard S1 (~$56/month):**
- Deployment slots (staging)
- Auto-scaling
- SSL certificates
- Backup/restore

## 📈 What You've Accomplished

Even on the free tier, you now have:
- ✅ **Professional CI/CD pipeline**
- ✅ **Automatic versioning and releases**  
- ✅ **Robust deployment with health checks**
- ✅ **Production monitoring capabilities**
- ✅ **Industry-standard DevOps practices**

This is exactly how many startups begin - with solid practices on a budget! 🚀

## 🔄 Testing Your Pipeline

Make a small change and test:

```bash
# Edit Program.cs to add a new weather type
# Commit and push
git add .
git commit -m "Add new weather type"
git push origin main

# Watch the magic happen in GitHub Actions!
```