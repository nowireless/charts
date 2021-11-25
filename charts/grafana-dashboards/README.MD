# grafana-dashboards Helm Chart

## Dashboard modification
When getting dashboards from https://grafana.com/grafana/dashboards/ modifiction may be neccessary to get the dashboard to work.

1.  Remove datasource inout selection:
    > There is not a way to select/provide this information in the current Grafana Helm chart.
    ```json
    "__inputs": [
        {
        "name": "DS_PROMETHEUS",
        "label": "prometheus",
        "description": "",
        "type": "datasource",
        "pluginId": "prometheus",
        "pluginName": "Prometheus"
        }
    ],
    ```

2. Add the following to add a dropdown the dashboard to select a datasource:
    ```json
    "templating": {
        "list": [
        {
            "description": null,
            "error": null,
            "hide": 0,
            "includeAll": false,
            "label": "Datasource",
            "multi": false,
            "name": "DS_PROMETHEUS",
            "options": [],
            "query": "prometheus",
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "type": "datasource"
        },
        {
    ```

3. Remove any `_` symbols in the file name if present. 