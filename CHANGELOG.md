# Changelog

All notable changes to this project are documented here. The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-07-08

### Added

- VMware Cloud Foundation platform IaC: vSphere workload domain (HA/DRS/vSAN
  compute clusters), NSX-T overlay networking (Tier-0/Tier-1 gateways,
  segments), and shared storage (datastore clusters with Storage DRS).
- Modular Terraform layout with reusable submodules under `modules/`.
- Environment-specific configuration for `dev` and `prod`.
- CI pipeline (fmt, validate, tflint), pre-commit hooks, and open-source
  project files (LICENSE, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT).
