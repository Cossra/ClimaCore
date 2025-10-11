#!/bin/bash

# Setup staging slot for zero-downtime deployments
# Run this script once to create the staging slot

echo "🚀 Setting up staging slot for ClimaCore..."

# Variables
RESOURCE_GROUP="rg-climacore"
APP_NAME="climacore-robert"
SLOT_NAME="staging"

# Create staging slot
echo "Creating staging slot..."
az webapp deployment slot create \
  --name $APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --slot $SLOT_NAME

# Configure slot settings (optional - these won't be swapped)
echo "Configuring slot settings..."
az webapp config appsettings set \
  --name $APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --slot $SLOT_NAME \
  --settings ASPNETCORE_ENVIRONMENT=Staging

# Set slot-specific configuration (won't swap with production)
az webapp config appsettings set \
  --name $APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --slot $SLOT_NAME \
  --slot-settings ASPNETCORE_ENVIRONMENT

echo "✅ Staging slot created successfully!"
echo "📍 Staging URL: https://$APP_NAME-$SLOT_NAME.azurewebsites.net"
echo "📍 Production URL: https://$APP_NAME.azurewebsites.net"
echo ""
echo "Next steps:"
echo "1. Update your GitHub Actions workflow to deploy to staging first"
echo "2. Test on staging, then swap to production"