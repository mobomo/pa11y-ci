# Mobomo pa11y-ci

A base image to perform pa11y testing for 508 and WCAG compliance.

The default configuration included in the image for testing is:

```
{
    "defaults": {
        "chromeLaunchConfig": {
            "args": [
                "--no-sandbox"
            ]
        },
        "reporters": [
            ["pa11y-ci-reporter-html", { "destination": "/app/reports", "includeZeroIssues": true }],
            ["json", { "fileName": "/app/reports/report.json"}],
            "cli"
        ],
        "timeout": 30000,
        "viewport": {
            "width": 320,
            "height": 480
        }
    },
    "urls": [
        "https://pa11y.org/",
        "https://pa11y.org/contributing",
        "https://mobomo.com/"
    ]
}
```

In order to test your site, copy this into a pa11y-config.json file in your project and mount it as a volume when running the image. Also, mount a reports folder to get both HTML and JSON formatted reports, in addition to the CLI output.

`docker run --rm -v "${PWD}/pa11y-config.json:/app/config/config.json" -v "${PWD}/reports:/app/reports" mobomo/pa11y-ci:latest`
