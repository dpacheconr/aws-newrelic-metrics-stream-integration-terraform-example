# Example 1: Simple numeric metric
aws cloudwatch put-metric-data \
  --namespace "MyTestApplication" \
  --metric-data \
    MetricName="ProcessorUtilization",Value=75.5,Unit="Percent" \
    MetricName="RequestCount",Value=100,Unit="Count" \
    MetricName="Latency",Value=250.3,Unit="Milliseconds" \
  --region eu-west-2 # Specify your desired AWS region

# Example 2: Metric with dimensions
aws cloudwatch put-metric-data \
  --namespace "MyTestService" \
  --metric-data \
    '[{
      "MetricName": "ActiveUsers",
      "Dimensions": [
        {"Name": "Region", "Value": "us-west-2"},
        {"Name": "Environment", "Value": "Dev"}
      ],
      "Value": 55,
      "Unit": "Count"
    }]' \
  --region eu-west-2

# Example 3: Multiple metrics in a single call, some with dimensions
aws cloudwatch put-metric-data \
  --namespace "MyWebservice" \
  --metric-data \
    '[{
      "MetricName": "HTTPRequestsTotal",
      "Dimensions": [
        {"Name": "Endpoint", "Value": "/api/users"},
        {"Name": "Method", "Value": "GET"}
      ],
      "Value": 120,
      "Unit": "Count"
    },
    {
      "MetricName": "HTTPRequestsTotal",
      "Dimensions": [
        {"Name": "Endpoint", "Value": "/api/products"},
        {"Name": "Method", "Value": "POST"}
      ],
      "Value": 30,
      "Unit": "Count"
    },
    {
      "MetricName": "DatabaseConnections",
      "Value": 15,
      "Unit": "Count"
    }]' \
  --region eu-west-2
