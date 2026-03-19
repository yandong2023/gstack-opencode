.PHONY: install uninstall list test lint clean

# Default: install
all: install

install:
	@./install.sh

# Developer mode: link files instead of copy
dev:
	@echo "🔗 Linking GStack components to OpenCode config..."
	@mkdir -p ~/.config/opencode/agents
	@mkdir -p ~/.config/opencode/commands
	@mkdir -p ~/.config/opencode/skills
	@ln -sf $(PWD)/agents/*.md ~/.config/opencode/agents/
	@ln -sf $(PWD)/commands/*.md ~/.config/opencode/commands/
	@ln -sf $(PWD)/skills/*.md ~/.config/opencode/skills/
	@echo "✅ Done."

uninstall:
	@echo "🗑️ Removing GStack components from OpenCode config..."
	@rm -rf ~/.config/opencode/agents
	@rm -rf ~/.config/opencode/commands
	@rm -rf ~/.config/opencode/skills
	@echo "✅ Done."

list:
	@echo "📜 Available Agents:"
	@ls agents/*.md | xargs -n 1 basename
	@echo ""
	@echo "📜 Available Commands:"
	@ls commands/*.md | xargs -n 1 basename

lint:
	@echo "🔍 Linting Markdown files..."
	@# Could use markdownlint if available
	@find . -name "*.md" | xargs -I {} grep -L "^---" {} || echo "Found files without frontmatter"

clean:
	@# No build artifacts to clean yet
