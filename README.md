# Helm Charts

## Add Helm repository

```bash
helm repo add swibrow https://swibrow.github.io/helm-charts
helm repo update
```

## Install chart

```bash
helm install --generate-name repo/chart
```

## Contributing

When using this repo locally or contributing to this repo, you will need to build the dependencies used for each helm chart.
You can run the following commands to do so:

```bash
cd charts/<chart>
helm dependency build
```

## Charts

- [babybuddy](charts/babybuddy/README.md)
- [code-server](charts/code-server/README.md)
- [cryptgeon](charts/crpptgeon/README.md)
- [custom-resources](charts/custom-resources/README.md)

