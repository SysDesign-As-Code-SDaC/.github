# Branch Protection Guidelines

This document outlines recommended branch protection rules for repositories in the SysDesign-As-Code organization.

## 🔒 Recommended Settings

### Main/Dev Branches

For `main` and `dev` branches, we recommend:

#### Required Status Checks
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- Required checks:
  - `lint-and-test` (CI workflow)
  - `security-scan` (Security workflow)
  - `dependency-review` (Dependency Review workflow)

#### Pull Request Reviews
- ✅ Require a pull request before merging
- ✅ Require approvals: **1** (minimum)
- ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Require review from Code Owners

#### Restrictions
- ✅ Do not allow bypassing the above settings
- ✅ Restrict who can push to matching branches: **Organization members only**
- ✅ Allow force pushes: **Disabled**
- ✅ Allow deletions: **Disabled**

#### Additional Settings
- ✅ Require linear history: **Enabled** (for cleaner git history)
- ✅ Include administrators: **Enabled** (apply rules to admins too)

## 🌿 Branch Strategy

### Branch Types

1. **Main/Dev Branches**
   - Full protection enabled
   - Require PR reviews
   - Require status checks

2. **Feature Branches** (`feature/*`)
   - No protection (developers can push freely)
   - PR required to merge to main/dev

3. **Release Branches** (`release/*`)
   - Similar protection to main
   - Additional release-specific checks

4. **Hotfix Branches** (`hotfix/*`)
   - Similar protection to main
   - Fast-track merge process

## 📋 Setting Up Branch Protection

### Via GitHub UI

1. Go to repository **Settings** → **Branches**
2. Click **Add rule** or edit existing rule
3. Configure as per guidelines above
4. Save changes

### Via GitHub API

```bash
# Example: Protect main branch
gh api repos/:owner/:repo/branches/main/protection \
  --method PUT \
  --field required_status_checks='{"strict":true,"contexts":["lint-and-test","security-scan"]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":1,"dismiss_stale_reviews":true}' \
  --field restrictions=null
```

### Via Terraform (if using Infrastructure as Code)

```hcl
resource "github_branch_protection" "main" {
  repository_id = github_repository.repo.node_id
  
  pattern                         = "main"
  enforce_admins                  = true
  require_signed_commits          = false
  required_linear_history         = true
  
  required_status_checks {
    strict   = true
    contexts = ["lint-and-test", "security-scan"]
  }
  
  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
  }
}
```

## 🔍 Status Check Requirements

### Standard Checks

All repositories should have these checks:

1. **Lint and Test** (`lint-and-test`)
   - Code formatting
   - Linting
   - Unit tests
   - Integration tests

2. **Security Scan** (`security-scan`)
   - Static analysis
   - Dependency scanning
   - Secret detection

3. **Dependency Review** (`dependency-review`)
   - Dependency security review
   - License compliance

### Component-Specific Checks

Additional checks may be required based on component:

- **Python Projects**: `mypy` type checking
- **Node Projects**: `npm audit`
- **Docker Projects**: Container scanning

## 📝 Exceptions

### Emergency Hotfixes

For critical production issues:
1. Create hotfix branch
2. Get expedited review
3. Merge with override (if configured)
4. Document in release notes

### Documentation-Only Changes

For documentation-only PRs:
- May skip some checks (with approval)
- Still require review
- Use `[skip ci]` in commit message if needed

## 🔄 Updating Protection Rules

1. Discuss changes with team
2. Update this document
3. Apply changes to repositories
4. Communicate changes to contributors

## 📚 Resources

- [GitHub Branch Protection Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
- [GitHub API - Branch Protection](https://docs.github.com/en/rest/branches/branch-protection)

