# AWS–New Relic Highly Configurable Terraform Integration

This module provisions all AWS and New Relic resources for a highly configurable integration, supporting both PUSH and PULL modes, with flexible metric filters and resource naming.

---

## Features
- Supports both **PUSH** and **PULL** integration modes
- Highly configurable via variables and `.tfvars` files
- Uses best practices for secrets and sensitive data
- Outputs all important resource identifiers

---

## Getting Started

### 1. Clone this repository and enter the directory
```sh
cd aws-newrelic-integration
```

### 2. Copy and edit the example variables file
```sh
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars and fill in your values
```

**Required variables in `terraform.tfvars`:**
```hcl
aws_region              = "<your-region>"
newrelic_account_id     = "<your-nr-account-id>"
newrelic_account_region = "US" # or "EU"
newrelic_api_key        = "<your-nrak-user-api-key>"         # User API key for provider
newrelic_ingest_license_key = "<your-nraa-ingest-license-key>" # Ingest License key for Firehose
name                    = "my-integration"
integration_mode        = "PUSH" # or "PULL"
include_metric_filters  = {}
exclude_metric_filters  = {}
```

- **Do NOT commit your real `terraform.tfvars` to version control.**
- All sensitive files are gitignored by default.

### 3. Initialize and validate
```sh
terraform init
terraform validate
```

### 4. Plan and apply
```sh
terraform plan -out=tfplan.out
terraform apply tfplan.out
```

### 5. Review plan in plaintext (optional)
```sh
terraform show -no-color tfplan.out > tfplan.txt
cat tfplan.txt
```

---

## Notes
- The `newrelic_api_key` must be a **User API key** (starts with `NRAK-`).
- The `newrelic_ingest_license_key` must be a **New Relic Ingest License key** (starts with `NRAA-` or `LICENSE-`).
- If you see errors about an AWS account already being linked, you must remove the existing integration in the New Relic UI or import it into Terraform.
- All state, plan, and secret files are ignored by `.gitignore`.

---

## Outputs
- `newrelic_role_arn`: IAM role ARN for New Relic
- `firehose_stream_name`: Kinesis Firehose stream name
- `s3_bucket_name`: S3 bucket for backup
- `metric_stream_name`: CloudWatch metric stream name

---

## References
- [New Relic Terraform Provider Docs](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)
- [AWS Cloud Integrations in New Relic](https://docs.newrelic.com/docs/integrations/amazon-integrations/get-started/connect-aws-new-relic/)
- [Official Example](https://github.com/newrelic/terraform-provider-newrelic/blob/main/examples/modules/cloud-integrations/aws/main.tf)
