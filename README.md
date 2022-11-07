# I18n::Translate::Rails

Translate rails locale files into other languages using the Google Translate api.

## System Requirements

rails 7.0.4
[^We have not confirmed that it works, but it probably works with other versions.]

## Setup

1. Install a config file.
```
$ bin/rails i18n:translate:install
```

2. Set google api key to `i18n_translate_api_key` in credentials.

## Use
```
$  bin/rails i18n:translate[config/locales/en.yml,ja]
```
