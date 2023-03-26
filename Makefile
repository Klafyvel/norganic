JULIA=julia

NORGANIC_ARCHIVE=norganic.tar.gz

# phonies

norganic: build/norganic

archive: $(NORGANIC_ARCHIVE)

comonicon:
	$(JULIA) --project -e "using Pkg; Pkg.instantiate()"
	$(JULIA) --project deps/build.jl install

compost: clean
clean:
	rm -rf build
	rm -rf $(NORGANIC_ARCHIVE)

.PHONY: clean archive comonicon compost

# targets
build/norganic:
	$(JULIA) --project -e "using Pkg; Pkg.instantiate()"
	$(JULIA) --project deps/build.jl app

$(NORGANIC_ARCHIVE): norganic
ifeq ($(OS),Windows_NT)
	Compress-Archive -Path build\norganic -DestinationPath $(NORGANIC_ARCHIVE)
else
	tar -cvzf $(NORGANIC_ARCHIVE) build/norganic
endif
