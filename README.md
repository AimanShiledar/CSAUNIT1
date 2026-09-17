# Unit 1 — Internet-Facing Recon Experiment

## Objective
Understand how quickly a normal internet-facing server picks up automated scans and login attempts once exposed.

## Setup
An EC2 Linux instance was launched via Terraform with a security group open to the internet on:
- SSH (22) → 0.0.0.0/0
- HTTP (80) → 0.0.0.0/0

Left running for [24–48 hours — fill in actual duration], public IP kept private per assignment instructions.

## Investigation
Logs pulled with:
\`\`\`bash
sudo journalctl -u sshd
sudo journalctl -u sshd | grep -i "failed"
\`\`\`

### Findings
| Metric | Result |
|---|---|
| Total failed login attempts | [fill in] |
| Unique source IPs | [fill in] |
| Usernames attempted | [e.g. root, admin, ubuntu, test] |
| Time to first attempt | [fill in] |
| Attempts likely automated? | [Yes/No + reasoning] |



![ssh logs](./screenshots/unit1-ssh-logs.png)



## Analysis
[Summarize timing/pattern, repeated usernames, source IP spread, etc.]

## Final Question: Do attackers really target only big companies?
[Conclusion backed by evidence — typically: no, automated scanners sweep the whole IPv4 space indiscriminately.]

## Terraform
\`\`\`bash
terraform init
terraform apply -var="key_pair_name=<your-key-pair>"
# after log collection:
terraform destroy
\`\`\`
