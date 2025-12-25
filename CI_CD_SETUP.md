# CI/CD Pipeline Setup

This document describes the GitHub Actions workflows configured for automated testing, building, and deployment of the javier_website project.

## Workflows Overview

### 1. **flutter.yml** - Main CI/CD Pipeline
Triggers on: `push` to `develop` or `main`, `pull_request` to `develop` or `main`

#### Jobs:

**analyze**
- ✅ Checks Flutter code quality with `flutter analyze`
- ✅ Validates localization files generation
- ✅ Runs on every push/PR (gates the pipeline)

**test**
- ✅ Runs unit, widget, and integration tests
- ✅ Collects code coverage reports
- ✅ Uploads coverage to Codecov
- ✅ Depends on: `analyze` job

**build_web**
- ✅ Builds production-ready web release
- ✅ Uploads build artifacts to GitHub
- ✅ Depends on: `analyze`, `test` jobs

**build_android** (main branch only)
- ✅ Builds release APK for Android
- ✅ Requires Java 11 setup
- ✅ Uploads APK artifact
- ✅ Only runs on `main` branch

**notification**
- ✅ Sends Slack notifications on pipeline failure
- ✅ Includes commit details, branch, and logs link

### 2. **deploy.yml** - Firebase Hosting Deployment
Triggers on: `push` to `main` branch only

#### Job: build_and_deploy
- ✅ Runs all tests before deploying
- ✅ Builds web release
- ✅ Deploys to Firebase Hosting (production)
- ✅ Sends Slack notifications (success/failure)
- ⚠️ Requires: `FIREBASE_SERVICE_ACCOUNT_KEY` secret

## Setup Instructions

### 1. Add Secrets to GitHub Repository

Navigate to: `Settings → Secrets and variables → Actions`

Add the following secrets:

#### `FIREBASE_SERVICE_ACCOUNT_KEY`
```bash
# Generate with Firebase CLI:
firebase init hosting --skip-setup
# Or get from Firebase Console: Project Settings → Service Accounts
```

#### `SLACK_WEBHOOK` (Optional)
```bash
# Get from Slack App Settings:
# https://api.slack.com/apps/YOUR_APP_ID/incoming-webhooks
```

### 2. Update Firebase Project ID

In `.github/workflows/deploy.yml`, update:
```yaml
projectId: javier-website  # ← Replace with your Firebase project ID
```

### 3. Verify Flutter Version

Both workflows use Flutter `3.19.0`. To update:
```yaml
flutter-version: '3.19.0'  # ← Modify in both workflows
```

## Workflow Status

### Current Status
- ✅ Analyze: Enabled (all branches)
- ✅ Test: Enabled (all branches)
- ✅ Build Web: Enabled (all branches)
- ✅ Build Android: Enabled (main only)
- ⏳ Deploy: Ready (requires secrets setup)

### Test Coverage
```
flutter test --coverage
└── Reports uploaded to Codecov
```

## Local Testing

### Run the same checks locally:

```bash
# Analyze code
flutter analyze

# Generate localization
flutter gen-l10n

# Run all tests
flutter test --coverage

# Build web
flutter build web --release

# Build Android
flutter build apk --release
```

## Troubleshooting

### Pipeline Failures

1. **Analyze failures**
   ```bash
   flutter analyze
   # Fix issues, then:
   git add . && git commit -m "fix: resolve lint issues"
   ```

2. **Test failures**
   ```bash
   flutter test
   # Debug locally, update tests, then push
   ```

3. **Build failures**
   ```bash
   flutter clean
   flutter pub get
   flutter gen-l10n
   flutter build web --release
   ```

### Firebase Deployment Issues

1. **Service account key expired**
   - Regenerate in Firebase Console
   - Update `FIREBASE_SERVICE_ACCOUNT_KEY` secret

2. **Wrong project ID**
   - Verify in `firebase.json`
   - Update in `deploy.yml`

3. **Insufficient permissions**
   - Check service account has: `Firebase Hosting Admin`

## Next Steps

1. ✅ Set up GitHub Secrets
2. ✅ Push to main branch to trigger deployment
3. ✅ Monitor workflow runs in: `Actions` tab
4. ✅ View coverage reports on Codecov
5. ✅ Integrate with Slack for notifications

## References

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Firebase Hosting Deploy Action](https://github.com/FirebaseExtended/action-hosting-deploy)
- [Flutter CI/CD Guide](https://docs.flutter.dev/deployment/cd)
- [Codecov Integration](https://codecov.io)
