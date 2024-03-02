# ![Truemail server - lightweight rack based web API](https://truemail-rb.org/assets/images/truemail_logo.png)

[![Maintainability](https://api.codeclimate.com/v1/badges/d80b60f7919dda358501/maintainability)](https://codeclimate.com/github/truemail-rb/truemail-rack/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d80b60f7919dda358501/test_coverage)](https://codeclimate.com/github/truemail-rb/truemail-rack/test_coverage)
[![CircleCI](https://circleci.com/gh/truemail-rb/truemail-rack.svg?style=svg)](https://circleci.com/gh/truemail-rb/truemail-rack)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/truemail-rb/truemail-rack)](https://github.com/truemail-rb/truemail-rack/releases)
[![Gitter](https://badges.gitter.im/truemail-rb/community.svg)](https://gitter.im/truemail-rb/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![GitHub](https://img.shields.io/github/license/truemail-rb/truemail-rack)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

***Truemail server*** - lightweight rack based web API wrapper for [Truemail](https://truemail-rb.org/truemail-gem) gem. Verify email via Regex, DNS, SMTP and even more. Be sure that email address valid and exists.

> Actual and maintainable documentation :books: for developers is living [here](https://truemail-rb.org/truemail-rack).

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Simple configuration example](#simple-configuration-example)
  - [Advanced configuration example](#advanced-configuration-example)
  - [Request/response example](#requestresponse-example)
    - [Existent email](#existent-email)
    - [Nonexistent email](#nonexistent-email)
    - [Version](#version)
    - [Healthcheck](#healthcheck)
- [Truemail family](#truemail-family)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)
- [Credits](#credits)
- [Versioning](#versioning)
- [Changelog](CHANGELOG.md)

## Features

- Application configuration through environment vars
- One endpoint for email validation with token-based authentication
- No DB usage

## Installation

```bash
git clone https://github.com/truemail-rb/truemail-rack.git
```

## Usage

Before run application you must configure it first. List of available env vars names and values:

| Var name | Value example | Required | Description |
| --- | :-: | :-: | --- |
| `VERIFIER_EMAIL` | `your_email@example.com` | ***+*** | Must be an existing email on behalf of which verification will be performed. |
| `ACCESS_TOKENS` | `some_token` | ***+*** | These tokens will be used for token-based authentication. Accepts one ore more values separated by commas. |
| `VERIFIER_DOMAIN` | `somedomain.com` | - | Must be an existing domain on behalf of which verification will be performed. By default verifier domain based on verifier email. |
| `EMAIL_PATTERN` | `/regex_pattern/` | - | You can override [default Truemail regex pattern](https://github.com/truemail-rb/truemail/blob/dee39d5aeda5ffee4c268f0847ab4167c2a13f09/lib/truemail/core.rb#L35). |
| `SMTP_ERROR_BODY_PATTERN` | `/regex_pattern/` | - | You can override [default Truemail regex pattern](https://github.com/truemail-rb/truemail/blob/dee39d5aeda5ffee4c268f0847ab4167c2a13f09/lib/truemail/core.rb#L38). |
| `CONNECTION_TIMEOUT` | `1` | - | Connection timeout is equal to `2` ms by default. |
| `RESPONSE_TIMEOUT` | `1` | - | A SMTP server response timeout is equal to `2` ms by default. |
| `CONNECTION_ATTEMPTS` | `3` | - | Total of connection attempts. It is equal to `2` by default. This parameter uses in mx lookup timeout error and smtp request (for cases when there is one mx server). |
| `DEFAULT_VALIDATION_TYPE` | `mx` | - |  You can predefine Truemail default validation type (`smtp`). Available validation types: [`regex`](https://truemail-rb.org/truemail-gem/#/validations-layers?id=regex-validation), [`mx`](https://truemail-rb.org/truemail-gem/#/validations-layers?id=mx-validation), [`mx_blacklist`](https://truemail-rb.org/truemail-gem/#/validations-layers?id=mx-blacklist-validation), [`smtp`](https://truemail-rb.org/truemail-gem/#/validations-layers?id=smtp-validation). |
| `VALIDATION_TYPE_FOR` | `somedomain.com:regex` | - | You can predefine which type of validation will be used for domains. Available validation types: `regex`, `mx`, `mx_blacklist`, `smtp`. This configuration will be used over `DEFAULT_VALIDATION_TYPE`. All of validations for `somedomain.com` will be processed with `regex` validation only. Accepts one or more key:value separated by commas. |
| `WHITELISTED_EMAILS` | `user@somedomain1.com` | - | Validation of email which [contains whitelisted email](https://truemail-rb.org/truemail-gem/#/validations-layers?id=whitelist-case) always will return `true`. Other validations will not processed even if it was defined in `VALIDATION_TYPE_FOR`. Accepts one ore more values separated by commas. |
| `BLACKLISTED_EMAILS` | `user@somedomain2.com` | - | Validation of email which [contains blacklisted email](https://truemail-rb.org/truemail-gem/#/validations-layers?id=blacklist-case) always will return `false`. Other validations will not processed even if it was defined in `VALIDATION_TYPE_FOR`. Accepts one ore more values separated by commas. |
| `WHITELISTED_DOMAINS` | `somedomain1.com` | - | Validation of email which [contains whitelisted domain](https://truemail-rb.org/truemail-gem/#/validations-layers?id=whitelist-case) always will return `true`. Other validations will not processed even if it was defined in `VALIDATION_TYPE_FOR`. Accepts one ore more values separated by commas. |
| `BLACKLISTED_DOMAINS` | `somedomain2.com` | - | Validation of email which [contains blacklisted domain](https://truemail-rb.org/truemail-gem/#/validations-layers?id=blacklist-case) always will return `false`. Other validations will not processed even if it was defined in `VALIDATION_TYPE_FOR`. Accepts one ore more values separated by commas. |
| `WHITELIST_VALIDATION` | `true` | - | With this option Truemail will validate email which [contains whitelisted domain only](https://truemail-rb.org/truemail-gem/#/validations-layers?id=whitelist-validation-case), i.e. if domain whitelisted, validation will passed to Regex, MX or SMTP validators. Validation of email which not contains whitelisted domain always will return `false`. It is equal `false` by default. |
| `BLACKLISTED_MX_IP_ADDRESSES` | `127.0.1.1,127.0.1.2` | - | With this option Truemail will filter out unwanted mx servers via predefined list of ip addresses. It can be used as a part of DEA (disposable email address) validations. Accepts one ore more values separated by commas. |
| `DNS` | `8.8.8.8,8.8.4.4:53` | - | This option will provide to use custom DNS gateway when Truemail interacts with DNS. If you won't specify nameserver's ports Truemail will use default DNS TCP/UDP port 53. Accepts one ore more values separated by commas. By default Truemail uses DNS gateway from system settings. |
| `NOT_RFC_MX_LOOKUP_FLOW` | `true` | - | This option will provide to use not RFC MX lookup flow. It means that MX and Null MX records will be checked on the DNS validation layer only. By default [this option is disabled](https://truemail-rb.org/truemail-gem/#/validations-layers?id=not-rfc-mx-lookup-flow). |
| `SMTP_PORT` | `2525` | - | SMTP port number. It is equal to `25` by default. |
| `SMTP_FAIL_FAST` | `true` | - | This option will provide to use SMTP fail fast behavior. When [smtp_fail_fast is enabled](https://truemail-rb.org/truemail-gem/#/validations-layers?id=smtp-fail-fast-enabled) it means that Truemail ends smtp validation session after first attempt on the first mx server in any fail cases (network connection/timeout error, smtp validation error). By default this option is disabled, available for SMTP validation only. |
| `SMTP_SAFE_CHECK` | `true` | - | This option will be parse bodies of SMTP errors. It will be helpful if SMTP server does not return an exact answer that the email does not exist. By default [this option is disabled](https://truemail-rb.org/truemail-gem/#/validations-layers?id=smtp-safe-check-disabled), available for SMTP validation only. |
| `LOG_STDOUT` | `true` | - | This option will be enable log all http requests to stdout. By default this option is disabled. |

Run Truemail server with command as in example below:

### Simple configuration example

```bash
VERIFIER_EMAIL=your_email@example.com ACCESS_TOKENS=a262d915-15bc-417c-afeb-842c63b54154 rackup

# =>
# Thin web server (v1.8.1 codename Infinite Smoothie)
# Maximum connections set to 1024
# Listening on localhost:9292, CTRL+C to stop
```

### Advanced configuration example

```bash
VERIFIER_EMAIL=your_email@example.com \
ACCESS_TOKENS=a262d915-15bc-417c-afeb-842c63b54154,f44cd67e-aaa0-4e6c-aa6c-d52cf61f84ac \
EMAIL_PATTERN="/\A.+@.+\z/" \
SMTP_ERROR_BODY_PATTERN="/(?=.*550)(?=.*(user|account|customer|mailbox|something_else)).*/" \
VALIDATION_TYPE_FOR=somedomain1.com:regex,somedomain2.com:mx \
WHITELISTED_EMAILS=whitelisted@example.com \
BLACKLISTED_EMAILS=blacklisted1@example.com,blacklisted2@example.com \
WHITELISTED_DOMAINS=somedomain3.com \
BLACKLISTED_DOMAINS=somedomain4.com,somedomain5.com \
WHITELIST_VALIDATION=true \
BLACKLISTED_MX_IP_ADDRESSES=127.0.1.1,127.0.1.2 \
DNS=8.8.8.8,8.8.4.4:53 \
NOT_RFC_MX_LOOKUP_FLOW=true \
SMTP_PORT=2525 \
SMTP_FAIL_FAST=true \
SMTP_SAFE_CHECK=true \
LOG_STDOUT=true \
thin -R config.ru -a 0.0.0.0 -p 9292 -e production start

# =>
# Thin web server (v1.8.1 codename Infinite Smoothie)
# Maximum connections set to 1024
# Listening on localhost:9292, CTRL+C to stop
# 127.0.0.1 - - [26/Feb/2020:16:41:13 +0200] "GET /?email=admin%40bestweb.com.ua HTTP/1.1" 200 - 0.9195
```

### Request/response example

#### Existent email

```bash
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: a262d915-15bc-417c-afeb-842c63b54154" http://localhost:9292?email=admin@bestweb.com.ua
```

```json
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 410
Connection: keep-alive
Server: thin

{
  "date": "2021-02-07 10:00:56 +0200",
  "email": "admin@bestweb.com.ua",
  "validation_type": "smtp",
  "success": true,
  "errors": null,
  "smtp_debug": null,
  "configuration": {
    "validation_type_by_domain": null,
    "whitelisted_emails": null,
    "blacklisted_emails": null,
    "whitelisted_domains": null,
    "blacklisted_domains": null,
    "whitelist_validation": false,
    "blacklisted_mx_ip_addresses": null,
    "dns": null,
    "email_pattern": "default gem value",
    "not_rfc_mx_lookup_flow": false,
    "smtp_error_body_pattern": "default gem value",
    "smtp_fail_fast": false,
    "smtp_safe_check": false
  }
}
```

#### Nonexistent email

```bash
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: a262d915-15bc-417c-afeb-842c63b54154" http://localhost:9292?email=ololo@bestweb.com.ua
```

```json
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 541
Connection: keep-alive
Server: thin

{
  "date": "2021-02-07 10:10:42 +0200",
  "email": "ololo@bestweb.com.ua",
  "validation_type": "smtp",
  "success": false,
  "errors": {
    "smtp": "smtp error"
  },
  "smtp_debug": [
    {
      "connection": true,
      "errors": {
        "rcptto": "550 5.7.1 No such user!\n"
      },
      "mail_host": "213.180.204.89",
      "port_opened": true
    }
  ],
  "configuration": {
    "validation_type_by_domain": null,
    "whitelisted_emails": null,
    "blacklisted_emails": null,
    "whitelisted_domains": null,
    "blacklisted_domains": null,
    "whitelist_validation": false,
    "blacklisted_mx_ip_addresses": null,
    "dns": null,
    "email_pattern": "default gem value",
    "not_rfc_mx_lookup_flow": false,
    "smtp_error_body_pattern": "default gem value",
    "smtp_fail_fast": false,
    "smtp_safe_check": false
  }
}
```

#### Version

```bash
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: a262d915-15bc-417c-afeb-842c63b54154" http://localhost:9292/version
```

```json
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 108
Content-Type: application/json
Server: thin

{
  "core": "3.3.0",
  "platform": "ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]",
  "version": "0.10.0"
}
```

#### Healthcheck

```bash
curl -i http://localhost:9292/healthcheck
```

```json
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 0
Connection: keep-alive
Server: thin
```

## Truemail family

All Truemail solutions: <https://truemail-rb.org>

| Name | Type | Description |
| --- | --- | --- |
| [truemail](https://github.com/truemail-rb/truemail) | ruby gem | Configurable framework agnostic plain Ruby email validator, main core |
| [truemail-go](https://github.com/truemail-rb/truemail-go) | go package | Configurable Golang email validator, main core |
| [truemail-rack-docker](https://github.com/truemail-rb/truemail-rack-docker-image) | docker image | Lightweight rack based web API [dockerized image](https://hub.docker.com/r/truemail/truemail-rack) :whale: of Truemail server |
| [truemail-ruby-client](https://github.com/truemail-rb/truemail-ruby-client) | ruby gem | Truemail web API client library for Ruby |
| [truemail-crystal-client](https://github.com/truemail-rb/truemail-crystal-client) | crystal shard | Truemail web API client library for Crystal |
| [truemail-java-client](https://github.com/truemail-rb/truemail-java-client) | java lib | Truemail web API client library for Java |
| [truemail-rspec](https://github.com/truemail-rb/truemail-rspec) | ruby gem | Truemail configuration and validator RSpec helpers |

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/truemail-rb/truemail-rack>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. Please check the [open tickets](https://github.com/truemail-rb/truemail-rack/issues). Be sure to follow Contributor Code of Conduct below and our [Contributing Guidelines](CONTRIBUTING.md).

## License

This application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Truemail project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [The Contributors](https://github.com/truemail-rb/truemail-rack/graphs/contributors) for code and awesome suggestions
- [The Stargazers](https://github.com/truemail-rb/truemail-rack/stargazers) for showing their support

## Versioning

`truemail-rack` uses [Semantic Versioning 2.0.0](https://semver.org)
