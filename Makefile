.PHONY: check-inspector check-generator publish-inspector publish-generator publish clean

# Check both packages for issues before publishing
check: check-inspector check-generator

# Check objectbox_inspector package
check-inspector:
	@echo "Checking objectbox_inspector package..."
	cd objectbox_inspector && \
	dart pub get && \
	dart analyze

# Check objectbox_inspector_generator package
check-generator:
	@echo "Checking objectbox_inspector_generator package..."
	cd objectbox_inspector_generator && \
	dart pub get && \
	dart analyze


dry-publish: check-inspector check-generator
	cd objectbox_inspector && flutter pub publish --dry-run
	cd objectbox_inspector_generator && flutter pub publish --dry-run

# Publish both packages
publish: check publish-inspector publish-generator

# Publish objectbox_inspector package
publish-inspector:
	@echo "Publishing objectbox_inspector package..."
	cd objectbox_inspector && dart pub publish --force

# Publish objectbox_inspector_generator package
publish-generator:
	@echo "Publishing objectbox_inspector_generator package..."
	cd objectbox_inspector_generator && dart pub publish --force

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf objectbox_inspector/.dart_tool
	rm -rf objectbox_inspector/build
	rm -rf objectbox_inspector_generator/.dart_tool
	rm -rf objectbox_inspector_generator/build
	rm -rf example/.dart_tool
	rm -rf example/build
