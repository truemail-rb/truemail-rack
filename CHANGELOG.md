# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.11.0] - 2024-04-29

### Changed

- Updated application dependencies ( `net-smtp` 0.5.0, `truemail` 3.3.1)
- Updated development dependencies
- Updated application version

## [0.10.0] - 2024-03-02

### Changed

- Updated application dependencies (`rack` 2.2.8.1, `net-smtp` 0.4.0.1, `truemail` 3.3)
- Updated Ruby version to 3.3.0
- Updated development dependencies
- Updated application version
- Updated readme

### Fixed

- Fixed security vulnerability issues: [CVE-2024-25126](https://github.com/advisories/GHSA-22f2-v57c-j9cx), [CVE-2024-26141](https://github.com/advisories/GHSA-xj5v-6v4g-jfw6), [CVE-2024-26146](https://github.com/advisories/GHSA-54rr-7fvw-6x8f)

## [0.9.0] - 2023-11-01

### Changed

- Updated runtime dependencies (`truemail`, `net-smtp`, `rack`, `thin`)
- Updated development dependencies
- Updated application version

## [0.8.1] - 2023-07-25

### Changed

- Updated application dependencies (`truemail` 3.0.9)
- Updated development dependencies
- Updated application version

## [0.8.0] - 2023-03-28

### Fixed

- Fixed security vulnerability issue [CVE-2023-27539](https://github.com/advisories/GHSA-c6qg-cjj8-47qp)

### Changed

- Updated development dependencies
- Updated application version

## [0.7.0] - 2023-03-11

### Added

- Added [`cspell`](https://cspell.org) linter
- Added [`markdownlint`](https://github.com/DavidAnson/markdownlint) linter
- Added [`shellcheck`](https://www.shellcheck.net) linter
- Added [`yamllint`](https://yamllint.readthedocs.io) linter
- Added [`lefthook`](https://github.com/evilmartians/lefthook) linters aggregator
- Added `changeloglint`
- Added auto creating release notes on GitHub
- Added auto releasing scripts

### Fixed

- Fixed security vulnerability issue [CVE-2023-27530](https://github.com/advisories/GHSA-3h57-hmj3-gj3p)

### Changed

- Updated application dependencies (`rack` 2.2.6.3, `truemail` 3.0.7)
- Updated development dependencies
- Updated application version
- Updated readme

## [0.6.0] - 2023-01-20

### Fixed

- Fixed security vulnerability issue [CVE-2022-44571](https://github.com/advisories/GHSA-93pm-5p5f-3ghx)

### Changed

- Updated application dependencies (`rack` 2.2.6.2, `truemail` 3.0.5)
- Updated Ruby version to 3.2.0
- Updated development dependencies
- Updated application version
- Updated readme

## [0.5.0] - 2022-11-03

### Added

- Ability to specify [whitelisted/blacklisted emails](https://github.com/truemail-rb/truemail/releases/tag/v3.0.0)

### Changed

- Updated application dependencies (`truemail` 3.0.1)
- Updated development dependencies
- Updated application codebase, tests
- Updated application docs, version

## [0.4.2] - 2022-10-11

### Changed

- Updated application dependencies (`rack` 2.2.4, `truemail` 2.7.5)
- Updated development dependencies
- Updated application version

## [0.4.1] - 2022-06-01

### Fixed

- Fixed security vulnerability issue [CVE-2022-30122](https://github.com/advisories/GHSA-hxqx-xwvh-44m2), [CVE-2022-30123](https://github.com/advisories/GHSA-wq4h-7r42-5hrr)

### Changed

- Updated application dependencies (`rack` 2.2.3.1, `truemail` 2.7.3)
- Updated Ruby version to 3.1.2
- Updated development dependencies
- Updated application version
- Updated readme

## [0.4.0] - 2022-03-08

### Added

- Ability to specify [SMTP port](https://github.com/truemail-rb/truemail/releases/tag/v2.7.0)

### Changed

- Updated `System::CommandLineParams`
- Updated `System::Configuration::COMMAND_LINE_ATTRS`
- Updated application dependencies (`truemail` 2.7.1)
- Updated Ruby version to 3.1.1
- Updated development dependencies
- Updated application version

## [0.3.1] - 2022-01-04

### Changed

- Updated application dependencies (`truemail` 2.6)
- Updated Ruby version to 3.1.0
- Updated development dependencies
- Updated application version

## [0.3.0] - 2021-12-25

### Added

- Added ability to track current application version and environment

### Updated

- Updated development dependencies
- Updated `rubocop`/`codeclimate` config
- Updated application version
- Updated documentation

## [0.2.19] - 2021-12-05

### Changed

- Updated application dependencies (`truemail` 2.5.4)
- Updated development dependencies
- Updated application version

## [0.2.18] - 2021-11-09

### Changed

- Updated application dependencies (`truemail` 2.5.3)
- Updated development dependencies
- Updated application version

## [0.2.17] - 2021-10-09

### Changed

- Updated application dependencies (`truemail` 2.5.2)
- Updated development dependencies
- Updated application version

## [0.2.16] - 2021-10-03

### Changed

- Updated application dependencies (`truemail` 2.5.1)
- Updated development dependencies
- Updated application version

## [0.2.15] - 2021-07-12

### Changed

- Updated application dependencies (`truemail` 2.4.6)
- Updated development dependencies
- Updated application version

## [0.2.14] - 2021-07-05

### Changed

- Updated application dependencies (`truemail` 2.4.4)
- Updated development dependencies
- Updated application version

## [0.2.13] - 2021-05-17

### Changed

- Updated application dependencies (`truemail` 2.4.2)
- Updated development dependencies
- Updated application version
- Updated CircleCI config

## [0.2.12] - 2021-05-10

- Ability to use [MxBlacklist validation layer](https://truemail-rb.org/truemail-gem/#/validations-layers?id=mx-blacklist-validation)

### Changed

- Updated `System::CommandLineParams`
- Updated `System::Configuration::COMMAND_LINE_ATTRS`
- Updated `Truemail` to latest version (2.4.1)
- Updated runtime/development dependencies
- Updated `rubocop`/`codeclimate` configs
- Updated application readme, version, changelog

## [0.2.11] - 2021-03-24

### Changed

- Updated application dependencies (`truemail` 2.3.2)
- Updated development dependencies
- Updated application version

## [0.2.10] - 2021-02-07

### Added

- Ability to use [custom DNS gateway](https://github.com/truemail-rb/truemail/releases/tag/v2.3.0)

### Changed

- Updated application dependencies (`truemail` 2.3.0)
- Updated development dependencies
- Updated application version

## [0.2.9] - 2021-01-20

### Changed

- Updated application dependencies (`truemail` 2.2.3)
- Updated Ruby version to 2.6.6
- Updated application version

## [0.2.8] - 2020-12-11

- Ability to use [SMTP fail fast flow](https://truemail-rb.org/truemail-gem/#/validations-layers?id=smtp-fail-fast-enabled)

### Changed

- Updated application dependencies
- Updated application documentation
- Updated application version

## [0.2.7] - 2020-12-07

### Changed

- Updated application dependencies (`truemail` 2.2.1)
- Updated development dependencies
- Updated application version

## [0.2.6] - 2020-11-25

### Changed

- Updated application dependencies (`truemail` 2.1.0)
- Updated development dependencies
- Updated application version

## [0.2.5] - 2020-10-23

### Changed

- Updated application dependencies (`truemail` 2.0.1)
- Updated application version

## [0.2.4] - 2020-08-06

### Added

- Added healthcheck endpoint

### Changed

- Updated application dependencies
- Updated application version

## [0.2.3] - 2020-06-26

### Changed

- Updated application dependencies, fixed `rack` security vulnerability
- Updated application version

## [0.2.2] - 2020-05-10

### Added

- Ability to use [not RFC MX lookup flow](https://truemail-rb.org/truemail-gem/#/validations-layers?id=not-rfc-mx-lookup-flow)

### Changed

- Updated application dependencies
- Updated application documentation
- Updated application version

## [0.2.1] - 2020-04-11

### Changed

- Updated application dependencies
- Updated application documentation
- Updated `rubocop` config
- Updated application version

## [0.2.0] - 2020-02-26

### Added

- Ability print out logs to stdout

### Changed

- Updated application documentation
- Updated application version

## [0.1.0] - 2020-02-22

### Added

- Basic functionality of `truemail` server
