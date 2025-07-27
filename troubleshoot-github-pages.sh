#!/bin/bash

echo "🔍 GitHub Pages Troubleshooting Tool"
echo "===================================="
echo ""

REPO_URL="https://github.com/K5HITIJ/portfolio"
SITE_URL="https://K5HITIJ.github.io/portfolio"

echo "📊 Repository: $REPO_URL"
echo "🌐 Expected Site URL: $SITE_URL"
echo ""

echo "🔧 Quick Checklist:"
echo ""

echo "1. ✅ Check Actions Status:"
echo "   Go to: $REPO_URL/actions"
echo "   Look for: 'Deploy to GitHub Pages' workflow"
echo "   Status should show: Green checkmark ✅"
echo ""

echo "2. ✅ Check Pages Settings:"
echo "   Go to: $REPO_URL/settings/pages"
echo "   Source should be: 'GitHub Actions'"
echo "   Should show: 'Your site is published at $SITE_URL'"
echo ""

echo "3. ✅ Test Site Access:"
echo "   URL: $SITE_URL"
echo "   Expected: Your portfolio website"
echo "   If 404: Wait 5-10 minutes and try again"
echo ""

echo "🚀 Manual Fix Steps:"
echo ""
echo "If still getting 404 after 10 minutes:"
echo ""
echo "Step 1: Go to Settings → Pages"
echo "Step 2: Change Source to 'Deploy from a branch'"
echo "Step 3: Select branch 'main' and folder '/ (root)'"
echo "Step 4: Click Save"
echo "Step 5: Wait 2-3 minutes"
echo ""

echo "📞 Need Help?"
echo "Check these URLs:"
echo "- Actions: $REPO_URL/actions"
echo "- Settings: $REPO_URL/settings/pages"
echo "- Your Site: $SITE_URL"
echo ""

echo "⏱️ Current time: $(date)"
echo "🔄 Last push: $(git log -1 --format='%cd' --date=local)"
