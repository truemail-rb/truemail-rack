# <img src='https://repository-images.githubusercontent.com/219712903/d41c8600-53d5-11ea-9fb1-9e1b89784329' height='250' alt='Truemail server - lightweight rack based web API' />

[![Maintainability](https://api.codeclimate.com/v1/badges/d80b60f7919dda358501/maintainability)](https://codeclimate.com/github/truemail-rb/truemail-rack/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/d80b60f7919dda358501/test_coverage)](https://codeclimate.com/github/truemail-rb/truemail-rack/test_coverage) [![CircleCI](https://circleci.com/gh/truemail-rb/truemail-rack.svg?style=svg)](https://circleci.com/gh/truemail-rb/truemail-rack) [![Gitter](https://badges.gitter.im/truemail-rb/community.svg)](https://gitter.im/truemail-rb/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

***Truemail server*** - lightweight rack based web API wrapper for [Truemail](https://github.com/rubygarage/truemail). Verify email via Regex, DNS and SMTP. Be sure that email address valid and exists.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Simple configuration example](#simple-configuration-example)
  - [Advanced configuration example](#advanced-configuration-example)
  - [Request/response example](#requestresponse-example)
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

## Intallation

    $ git clone https://github.com/truemail-rb/truemail-rack.git

## Usage

Before run application you must configure it first. List of available env vars names and values:

| Var name | Value example | Required | Description |
| --- | :-: | :-: | --- |
| `VERIFIER_EMAIL` | `your_email@example.com` | ***+*** | Must be an existing email on behalf of which verification will be performed. |
| `ACCESS_TOKENS` | `some_token` | ***+*** | These tokens will be used for token-based authentication. Accepts one ore more values separated by commas. |
| `VERIFIER_DOMAIN` | `somedomain.com` | - | Must be an existing domain on behalf of which verification will be performed. By default verifier domain based on verifier email. |
| `EMAIL_PATTERN` | `/regex_pattern/` | - | You can override [default Truemail regex pattern](https://github.com/rubygarage/truemail/blob/a42a6830b25cb4224af00c4daf5e26574b540636/lib/truemail/core.rb#L33). |
| `SMTP_ERROR_BODY_PATTERN` | `/regex_pattern/` | - | You can override [default Truemail regex pattern](https://github.com/rubygarage/truemail/blob/a42a6830b25cb4224af00c4daf5e26574b540636/lib/truemail/core.rb#L36). |
| `CONNECTION_TIMEOUT` | `1` | - | Connection timeout is equal to `2` ms by default. |
| `RESPONSE_TIMEOUT` | `1` | - | A SMTP server response timeout is equal to `2` ms by default. |
| `CONNECTION_ATTEMPTS` | `3` | - | Total of connection attempts. It is equal to `2` by default. This parameter uses in mx lookup timeout error and smtp request (for cases when there is one mx server). |
| `DEFAULT_VALIDATION_TYPE` | `mx` | - |  You can predefine Truemail default validation type (`smtp`). Available validation types: [`regex`](https://github.com/rubygarage/truemail#regex-validation), [`mx`](https://github.com/rubygarage/truemail#mx-validation), [`smtp`](https://github.com/rubygarage/truemail#smtp-validation). |
| `VALIDATION_TYPE_FOR` | `somedomain.com:regex` | - | You can predefine which type of validation will be used for domains. Available validation types: `regex`, `mx`, `smtp`. This configuration will be used over `DEFAULT_VALIDATION_TYPE`. All of validations for `somedomain.com` will be processed with `regex` validation only. Accepts one ore more key:value separated by commas. |
| `WHITELISTED_DOMAINS` | `somedomain1.com` | - | Validation of email which [contains whitelisted domain](https://github.com/rubygarage/truemail#whitelist-case) always will return `true`. Other validations will not processed even if it was defined in `VALIDATION_TYPE_FOR`. Accepts one ore more values separated by commas. |
| `WHITELIST_VALIDATION` | `true` | - | With this option Truemail will validate email which [contains whitelisted domain only](https://github.com/rubygarage/truemail#whitelist-validation-case), i.e. if domain whitelisted, validation will passed to Regex, MX or SMTP validators. Validation of email which not contains whitelisted domain always will return `false`. It is equal `false` by default. |
| `BLACKLISTED_DOMAINS` | `somedomain2.com` | - | Validation of email which [contains blacklisted domain](https://github.com/rubygarage/truemail#blacklist-case) always will return `false`. Other validations will not processed even if it was defined in `VALIDATION_TYPE_FOR`. Accepts one ore more values separated by commas. |
| `SMTP_SAFE_CHECK` | `true` | - | This option will be parse bodies of SMTP errors. It will be helpful if SMTP server does not return an exact answer that the email does not exist. By default [this option is disabled](https://github.com/rubygarage/truemail#smtp-safe-check-disabled), available for SMTP validation only. |
| `LOG_STDOUT` | `true`  | - | This option will be enable log all http requests to stdout. By default this option is disabled. |

Run Truemail server with command as in example below:

### Simple configuration example:

```bash
VERIFIER_EMAIL=your_email@example.com ACCESS_TOKENS=a262d915-15bc-417c-afeb-842c63b54154 rackup

# =>
# Thin web server (v1.7.2 codename Bachmanity)
# Maximum connections set to 1024
# Listening on localhost:9292, CTRL+C to stop
```

### Advanced configuration example:

```bash
VERIFIER_EMAIL=your_email@example.com \
ACCESS_TOKENS=a262d915-15bc-417c-afeb-842c63b54154,f44cd67e-aaa0-4e6c-aa6c-d52cf61f84ac \
EMAIL_PATTERN="/\A.+@.+\z/" \
SMTP_ERROR_BODY_PATTERN="/(?=.*550)(?=.*(user|account|customer|mailbox|something_else)).*/" \
VALIDATION_TYPE_FOR=somedomain1.com:regex,somedomain2.com:mx \
WHITELISTED_DOMAINS=somedomain3.com \
WHITELIST_VALIDATION=true \
BLACKLISTED_DOMAINS=somedomain4.com,somedomain5.com \
SMTP_SAFE_CHECK=true \
LOG_STDOUT=true \
thin -R config.ru -a 0.0.0.0 -p 9292 -e production start

# =>
# Thin web server (v1.7.2 codename Bachmanity)
# Maximum connections set to 1024
# Listening on localhost:9292, CTRL+C to stop
# 127.0.0.1 - - [26/Feb/2020:16:41:13 +0200] "GET /?email=admin%40bestweb.com.ua HTTP/1.1" 200 - 0.9195
```

### Request/response example

```bash
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: a262d915-15bc-417c-afeb-842c63b54154" http://localhost:9292?email=admin@bestweb.com.ua
```

```json
HTTP/1.1 200 OK
Content-Type: application/json
Connection: close
Server: thin

{
  "date": "2020-02-26 17:00:56 +0200",
  "email": "admin@bestweb.com.ua",
  "validation_type": "smtp",
  "success": true,
  "errors": null,
  "smtp_debug": null,
  "configuration": {
    "validation_type_by_domain": null,
    "whitelist_validation": false,
    "whitelisted_domains": null,
    "blacklisted_domains": null,
    "smtp_safe_check": false,
    "email_pattern": "default gem value",
    "smtp_error_body_pattern": "default gem value"
  }
}
```

## Truemail family

All Truemail extensions: https://github.com/truemail-rb

### truemail

gem `truemail` - configurable framework agnostic plain Ruby email validator, https://github.com/rubygarage/truemail

### truemail-rspec

gem `truemail-rspec` - Truemail configuration and validator RSpec helpers, https://github.com/truemail-rb/truemail-rspec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/truemail-rb/truemail-rack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. Please check the [open tikets](https://github.com/truemail-rb/truemail-rack/issues). Be shure to follow Contributor Code of Conduct below and our [Contributing Guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Truemail project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [The Contributors](https://github.com/truemail-rb/truemail-rack/graphs/contributors) for code and awesome suggestions
- [The Stargazers](https://github.com/truemail-rb/truemail-rack/stargazers) for showing their support

## Versioning

Truemail uses [Semantic Versioning 2.0.0](https://semver.org)
