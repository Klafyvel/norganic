JULIA=julia

NORGANIC_ARCHIVE=norganic.tar.gz

# phonies

norganic: build/norganic

archive: $(NORGANIC_ARCHIVE)

comonicon:
	$(JULIA) --project deps/build.jl install

instantiate:
	$(JULIA) --project -e "using Pkg; Pkg.instantiate()"

compost: clean
clean:
	rm -rf build
	rm -rf $(NORGANIC_ARCHIVE)

upload: archive
	curl \
		-sSL \
		-XPOST \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: token $(GITHUB_TOKEN)" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		-H "Content-Type: application/octet-stream" \
		-F file=@$(NORGANIC_ARCHIVE) \
		--header "Content-Type:application/octet-stream" \
		"https://uploads.github.com/repos/$(GITHUB_REPOSITORY)/releases/$(RELEASE_ID)/assets?name=$(NORGANIC_ARCHIVE)"

.PHONY: clean archive comonicon compost upload instantiate

# targets
build/norganic: instantiate
	$(JULIA) --project deps/build.jl app

$(NORGANIC_ARCHIVE): norganic
ifeq ($(OS),Windows_NT)
	Compress-Archive -Path build/norganic -DestinationPath $(NORGANIC_ARCHIVE)
else
	tar -cvzf $(NORGANIC_ARCHIVE) build/norganic
endif
