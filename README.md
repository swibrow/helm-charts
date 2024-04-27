# Helm Charts

[Repository cloned from Renovate Helm Charts](https://github.com/renovatebot/helm-charts)

## Kubernetes version support

Test the latest versions of Kubernetes.
The general concept is that we track the versions of Kubernetes that are supported by the major cloud providers.

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
