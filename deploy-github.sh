#!/bin/bash

echo "🚀 GitHub Pages Deployment Script"
echo "=================================="
echo ""

# Check if user provided repository URL
if [ -z "$1" ]; then
    echo "❌ Error: Please provide your GitHub repository URL"
    echo ""
    echo "Usage: ./deploy-github.sh https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git"
    echo ""
    echo "Example: ./deploy-github.sh https://github.com/mishrak/portfolio.git"
    echo ""
    echo "To create a repository:"
    echo "1. Go to https://github.com/new"
    echo "2. Create a repository named 'portfolio' or 'your-username.github.io'"
    echo "3. Make it public"
    echo "4. Don't initialize with README"
    echo "5. Copy the repository URL and run this script"
    exit 1
fi

REPO_URL=$1

echo "📝 Adding remote repository..."
git remote add origin $REPO_URL

echo "📤 Pushing code to GitHub..."
git push -u origin main

echo ""
echo "✅ Code pushed successfully!"
echo ""
echo "🔧 Next steps:"
echo "1. Go to your repository on GitHub"
echo "2. Click Settings → Pages"
echo "3. Source: Select 'GitHub Actions'"
echo "4. Your site will be live in 2-3 minutes!"
echo ""

# Extract username and repo name for URL
REPO_INFO=$(echo $REPO_URL | sed 's/.*github\.com[:/]\(.*\)\.git/\1/')
USERNAME=$(echo $REPO_INFO | cut -d'/' -f1)
REPO_NAME=$(echo $REPO_INFO | cut -d'/' -f2)

if [ "$REPO_NAME" = "$USERNAME.github.io" ]; then
    SITE_URL="https://$USERNAME.github.io"
else
    SITE_URL="https://$USERNAME.github.io/$REPO_NAME"
fi

echo "🌐 Your site will be available at: $SITE_URL"
echo ""
echo "📊 GitHub repository: https://github.com/$REPO_INFO"
