# GitHub Integration Log

This document lists the exact Git commands we used to set up version control, commit the UI code, and push the iOS project to GitHub. You can show these to your teacher to demonstrate the Git workflow.

### 1. Initializing the Repository
We started by moving into the project directory and initializing a new Git tracking repository:
```bash
cd "AGILE PROJECT_FINAL"
git init
```

### 2. The First Commit
We staged all the foundational Xcode project files and our custom `ContentView.swift` app code, then sealed them in a commit snapshot.
```bash
git add .
git commit -m "Initial commit for AGILE PROJECT_FINAL"
```

### 3. Setting the Branch and Linking GitHub Remote
We set our main working branch to `main` and then connected our local folder to your online GitHub repository.
```bash
git branch -M main
git remote add origin https://github.com/adithyaanandbtech24-sys/AGILE_PROJECT.git
```

### 4. Ignoring Build Artifacts
Before pushing, we made sure to keep our repository clean by telling Git to ignore Xcode's heavy `build/` folder.
```bash
echo "build/" > .gitignore
git add .gitignore
git commit -m "Add .gitignore to prevent build junk"
```

### 5. Pushing to GitHub
Finally, we pushed all of our committed local work up to the remote GitHub repository so it is safely backed up and available online.
```bash
git push -u origin main
```

---
**To demonstrate your work to your teacher live in the terminal right now, you can run:**
- `git status` (Shows that your working tree is clean)
- `git log --oneline` (Shows a history of the commits we made)
- `git remote -v` (Shows the link to your GitHub repo)
