# V18 AI and LLM Security

## V18.1 AI and LLM Integration Security

### SONATYPE-18.1.1 (L1)

Verify that features integrating large language models (LLMs) or other AI-generated content address the OWASP Top 10 for LLM Applications, including but not limited to: prompt injection, insecure output handling, training data poisoning, model denial of service, and sensitive information disclosure.

### SONATYPE-18.1.2 (L1)

Verify that the application does not transmit Highly Confidential data (as defined by Sonatype's Data Classification Policy) to any external AI service or API.

### SONATYPE-18.1.3 (L1)

Verify that AI-generated outputs are validated before being used in production functionality, particularly where outputs influence security decisions, customer-facing content, or compliance-relevant operations.
