REMOTE_TAGS := $(shell git ls-remote --tags origin | grep -c $(version))
version-up:
	@if [ $(REMOTE_TAGS) -gt 1 ]; then\
		echo "tag: $(version) already exists";\
		exit 1;\
	fi
	git tag -a $(version) -m "bump $(version)"
	git push origin $(version)
	gh release create $(version) --title "Bump $(version)" -F CHANGELOG.md
