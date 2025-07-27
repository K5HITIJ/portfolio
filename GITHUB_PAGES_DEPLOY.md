# 🚀 GitHub Pages Deployment Guide

## Quick Deployment (5 minutes)

### Step 1: Create GitHub Repository
1. **Go to**: [github.com/new](https://github.com/new)
2. **Repository name**: Choose one:
   - `portfolio` → Will be at `username.github.io/portfolio`
   - `your-username.github.io` → Will be at `username.github.io`
3. **Make it Public** ✅
4. **Don't initialize** with README ❌
5. **Click "Create repository"**

### Step 2: Deploy Your Code

#### Option A: Using the Script (Recommended)
```bash
./deploy-github.sh https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
```

#### Option B: Manual Commands
```bash
# Add your repository
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git

# Push your code
git push -u origin main
```

### Step 3: Enable GitHub Pages
1. **Go to your repository** on GitHub
2. **Click Settings** → **Pages**
3. **Source**: Select **"GitHub Actions"** ✅
4. **Click Save**

### Step 4: Wait for Deployment
- ⏱️ **Deployment time**: 2-3 minutes
- ✅ **Status**: Check the **Actions** tab for progress
- 🌐 **Your site**: Will be live at the URL shown

---

## 🎯 Repository Name Options

### Option 1: Personal Site (Recommended)
- **Name**: `your-username.github.io`
- **URL**: `https://your-username.github.io`
- **Best for**: Main portfolio/personal website

### Option 2: Project Site
- **Name**: `portfolio` (or any name)
- **URL**: `https://your-username.github.io/portfolio`
- **Best for**: Specific project showcase

---

## 📊 What Happens After Deployment

### Automatic Features ✅
- **HTTPS enabled** automatically
- **Custom domain** support available
- **CDN delivery** worldwide
- **Automatic rebuilds** on code changes
- **Zero downtime** deployments

### Your GitHub Actions Workflow
The workflow in `.github/workflows/deploy.yml` will:
1. ✅ **Checkout** your code
2. ✅ **Build** static files
3. ✅ **Deploy** to GitHub Pages
4. ✅ **Update** your live site

---

## 🛠️ Troubleshooting

### Common Issues:

**❌ Repository not found**
- Make sure the repository is public
- Check the URL is correct

**❌ Pages not enabled**
- Go to Settings → Pages
- Select "GitHub Actions" as source

**❌ 404 Error after deployment**
- Wait 5-10 minutes for DNS propagation
- Check if `index.html` is in the root directory

**❌ Styling not working**
- Clear browser cache (Ctrl+F5 / Cmd+Shift+R)
- Check if CSS files are served correctly

### Need Help?
- **GitHub Pages Docs**: [docs.github.com/pages](https://docs.github.com/pages)
- **Check build status**: Repository → Actions tab
- **Custom domain setup**: Settings → Pages → Custom domain

---

## 🎨 After Deployment

### 1. Update Content
- **Edit** `index.html` for personal information
- **Add** real project links and descriptions
- **Update** social media links

### 2. Custom Domain (Optional)
- **Buy a domain** or use free ones (freenom.com)
- **Add CNAME file** with your domain
- **Configure DNS** with your provider
- **Enable in** Settings → Pages → Custom domain

### 3. Analytics (Optional)
- **Google Analytics**: Add tracking code to `index.html`
- **GitHub Insights**: Built-in traffic analytics
- **Lighthouse**: Test performance automatically

### 4. SEO Optimization
- **Submit to Google**: Google Search Console
- **Social sharing**: Test Open Graph tags
- **Performance**: Use PageSpeed Insights

---

## ✨ Examples

### Successful Repository Names:
- `mishrak.github.io` → `https://mishrak.github.io`
- `portfolio` → `https://mishrak.github.io/portfolio`
- `personal-website` → `https://mishrak.github.io/personal-website`

### Professional URLs:
- ✅ `https://mishrak.github.io`
- ✅ `https://mishrak.github.io/portfolio`
- ✅ `https://mishrak.dev` (with custom domain)

---

**🎉 Ready to deploy? Create your repository and run the deployment script!**
