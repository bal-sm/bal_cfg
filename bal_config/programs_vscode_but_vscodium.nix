{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    package = pkgs.vscodium;
    extensions = [ # fill plz, nanti aja we banyak soalnya
      pkgs.vscode-extensions.ms-pyright.pyright
      pkgs.vscode-extensions.ms-python.black-formatter
      pkgs.vscode-extensions.batisteo.vscode-django
      pkgs.vscode-extensions.tamasfe.even-better-toml
      pkgs.vscode-extensions.eamodio.gitlens # fun
      pkgs.vscode-extensions.ms-toolsai.jupyter
      pkgs.vscode-extensions.ms-toolsai.vscode-jupyter-slideshow
      pkgs.vscode-extensions.ms-toolsai.vscode-jupyter-cell-tags
      # pkgs.vscode-extensions.ms-vscode.cmake-tools
      # pkgs.vscode-extensions.ms-vscode.cpptools
      # > Me: Disabled 'cause proprietary euy.
    ];
    globalSnippets = { }; # gak usah dulu
    # haskell things, liat geura vscode options-nya
    keybindings = [ ];
    # look keybindings for more options
    languageSnippets = { }; # gimana nanti
    mutableExtensionsDir = true; # aja we
    userSettings = {
      "accessibility.dimUnfocused.enabled": false,
      "better-comments.tags": [
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF2D00",
            "italic": false,
            "strikethrough": false,
            "tag": "!",
            "underline": true
        },
        {
            "backgroundColor": "transparent",
            "bold": false,
            "color": "#3498DB",
            "italic": true,
            "strikethrough": false,
            "tag": "?",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": false,
            "color": "#474747",
            "italic": false,
            "strikethrough": true,
            "tag": "//",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF8C00",
            "italic": false,
            "strikethrough": false,
            "tag": "TODO",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": false,
            "color": "#98C379",
            "italic": false,
            "strikethrough": false,
            "tag": "*",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": false,
            "color": "#309EC4",
            "italic": true,
            "strikethrough": false,
            "tag": "\":",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF2D00",
            "italic": false,
            "strikethrough": false,
            "tag": "BUG",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF8C00",
            "italic": false,
            "strikethrough": false,
            "tag": "HACK",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF2D00",
            "italic": false,
            "strikethrough": false,
            "tag": "FIXME",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF2D00",
            "italic": false,
            "strikethrough": false,
            "tag": "XXX",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF8C00",
            "italic": false,
            "strikethrough": false,
            "tag": "[ ]",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#98C379",
            "italic": false,
            "strikethrough": false,
            "tag": "[x]",
            "underline": false
        },
        {
            "backgroundColor": "transparent",
            "bold": true,
            "color": "#FF2D00",
            "italic": false,
            "strikethrough": false,
            "tag": "LEGACY",
            "underline": false
        }
      ],
      "debug.toolBarLocation": "commandCenter",
      "dev.containers.dockerPath": "podman",
      "diffEditor.experimental.showMoves": true,
      "diffEditor.ignoreTrimWhitespace": false,
      "editor.autoClosingBrackets": "languageDefined",
      "editor.autoClosingComments": "languageDefined",
      "editor.autoClosingDelete": "auto",
      "editor.autoClosingOvertype": "always",
      "editor.autoClosingQuotes": "never",
      "editor.autoIndent": "full",
      "editor.autoSurround": "languageDefined",
      "editor.bracketPairColorization.enabled": true,
      "editor.bracketPairColorization.independentColorPoolPerBracketType": false,
      "editor.codeActionsOnSave": {},
      "editor.codeActionWidget.includeNearbyQuickFixes": true,
      "editor.codeActionWidget.showHeaders": true,
      "editor.codeLens": true,
      "editor.codeLensFontFamily": "",
      "editor.codeLensFontSize": 0,
      "editor.colorDecorators": true,
      "editor.colorDecoratorsActivatedOn": "clickAndHover",
      "editor.colorDecoratorsLimit": 500,
      "editor.comments.ignoreEmptyLines": false,
      "editor.comments.insertSpace": true,
      "editor.copyWithSyntaxHighlighting": true,
      "editor.cursorBlinking": "smooth",
      "editor.cursorSmoothCaretAnimation": "explicit",
      "editor.cursorStyle": "line",
      "editor.defaultColorDecorators": false,
      "editor.defaultFoldingRangeProvider": null,
      "editor.defaultFormatter": null,
      "editor.definitionLinkOpensInPeek": false,
      "editor.detectIndentation": true,
      "editor.dragAndDrop": true,
      "editor.dropIntoEditor.enabled": true,
      "editor.dropIntoEditor.showDropSelector": "afterDrop",
      "editor.fontFamily": "'JetBrainsMono Nerd Font', 'RobotoMono Nerd Font', 'Droid Sans Mono', 'monospace', monospace",
      "editor.fontLigatures": true,
      "editor.fontSize": 14,
      "editor.inlineSuggest.enabled": true,
      "editor.insertSpaces": true,
      "editor.linkedEditing": true,
      "editor.minimap.enabled": true,
      "editor.minimap.renderCharacters": false,
      "editor.multiCursorModifier": "alt",
      "editor.renderWhitespace": "selection",
      "editor.rulers": [
        80,
        88,
        120
      ],
      "editor.smoothScrolling": true,
      "editor.stickyScroll.enabled": true,
      "editor.tabCompletion": "on",
      "editor.tabSize": 4,
      "editor.wordWrap": "off",
      "explorer.confirmUndo": "verbose",
      "extensions.autoUpdate": "onlyEnabledExtensions",
      "files.associations": {
        "*.code-workspace.dist": "jsonc",
        "*.nix": "properties",
        ".git-blame-ignore-revs": "properties",
        "TAG_EDITMSG": "git-commit"
      },
      "files.autoSave": "onFocusChange",
      "files.exclude": {},
      "files.insertFinalNewline": false,
      "files.readonlyExclude": {},
      "files.readonlyFromPermissions": true,
      "files.readonlyInclude": {
        "**/.venv/*/**": true
      },
      "files.simpleDialog.enable": false,
      "files.trimFinalNewlines": false,
      "files.trimTrailingWhitespace": false,
      "files.watcherExclude": {
        "**/.venv/*/**": true
      },
      "git.autofetch": "all",
      "git.branchProtection": [
        "master"
      ],
      "git.confirmSync": false,
      "git.defaultBranchName": "",
      "git.enableSmartCommit": false,
      "git.repositoryScanIgnoredFolders": [
        "node_modules",
        ".venv"
      ],
      "git.showActionButton": {
        "commit": true,
        "publish": false,
        "sync": true
      },
      "git.suggestSmartCommit": false,
      "git.terminalGitEditor": true,
      "git.verboseCommit": true,
      "github.copilot.enable": {
        "*": true,
        "json": false,
        "markdown": true,
        "plaintext": true,
        "scminput": false,
        "yaml": false
      },
      "github.gitProtocol": "ssh",
      "githubPullRequests.pullBranch": "never",
      "gitlens.advanced.fileHistoryFollowsRenames": true,
      "gitlens.codeLens.enabled": false,
      "gitlens.defaultDateFormat": "YYYY-MM-DD, HH:mm",
      "gitlens.defaultDateShortFormat": "D MMM YYYY",
      "GitLive.Issue tracker integration": "Disabled",
      "GitLive.Special branches": "main|master|trunk|dev|develop|qa|test|release[-/].*",
      "javascript.suggest.autoImports": true,
      "javascript.updateImportsOnFileMove.enabled": "prompt",
      "markdown.extension.italic.indicator": "_",
      "markdown.extension.math.enabled": false,
      "markdown.extension.tableFormatter.enabled": false,
      "markdown.extension.theming.decoration.renderCodeSpan": false,
      "markdown.extension.theming.decoration.renderStrikethrough": false,
      "markdown.preferredMdPathExtensionStyle": "includeExtension",
      "markdownlint.config": {
        "blanks-around-lists": true,
        "emphasis-style": false,
        "fenced-code-language": false,
        "no-duplicate-heading": false,
        "no-emphasis-as-heading": false,
        "no-inline-html": false,
        "no-trailing-punctuation": false,
        "no-trailing-spaces": false,
        "ul-indent": false
      },
      "myst.preview.extensions": [
        "amsmath",
        "colon_fence",
        "deflist",
        "dollarmath"
      ],
      "notebook.gotoSymbols.showAllSymbols": true,
      "peacock.favoriteColors": [
        {
            "name": "Angular Red",
            "value": "#dd0531"
        },
        {
            "name": "Azure Blue",
            "value": "#007fff"
        },
        {
            "name": "JavaScript Yellow",
            "value": "#f9e64f"
        },
        {
            "name": "Mandalorian Blue",
            "value": "#1857a4"
        },
        {
            "name": "Node Green",
            "value": "#215732"
        },
        {
            "name": "React Blue",
            "value": "#61dafb"
        },
        {
            "name": "Something Different",
            "value": "#832561"
        },
        {
            "name": "Svelte Orange",
            "value": "#ff3d00"
        },
        {
            "name": "Vue Green",
            "value": "#42b883"
        },
        {
            "name": "Silk Blue",
            "value": "001F4F"
        }
      ],
      "python.analysis.inlayHints.callArgumentNames": "all",
      "python.analysis.inlayHints.functionReturnTypes": true,
      "python.analysis.inlayHints.pytestParameters": true,
      "python.analysis.inlayHints.variableTypes": true,
      "python.experiments.optInto": [
        "pythonTerminalEnvVarActivation"
      ],
      "python.languageServer": "None",
      "python.venvFolders": [
        ".local/pipx/venvs"
      ],
      "scm.experimental.showSyncView": false,
      "settingsSync.ignoredSettings": [
        "terminal.integrated.defaultProfile.linux",
        "dev.containers.dockerPath"
      ],
      "telemetry.telemetryLevel": "off",
      "terminal.integrated.cursorStyle": "block",
      "terminal.integrated.cursorStyleInactive": "outline",
      "terminal.integrated.defaultProfile.linux": "zsh",
      "todo-tree.general.tags": [
        "!",
        "?",
        "//",
        "TODO",
        "*",
        "\":",
        "BUG",
        "HACK",
        "FIXME",
        "XXX",
        "[ ]",
        "[x]",
        "LEGACY"
      ],
      "typescript.suggest.autoImports": true,
      "typescript.updateImportsOnFileMove.enabled": "prompt",
      "window.commandCenter": true,
      "window.confirmBeforeClose": "never",
      "window.dialogStyle": "custom",
      "window.titleBarStyle": "custom",
      "workbench.activityBar.location": "side",
      "workbench.editor.dragToOpenWindow": false,
      "workbench.editor.enablePreview": true,
      "workbench.editor.labelFormat": "short",
      "workbench.editor.pinnedTabSizing": "normal",
      "workbench.editor.pinnedTabsOnSeparateRow": true,
      "workbench.editor.showTabs": "multiple",
      "workbench.editor.tabActionCloseVisibility": false,
      "workbench.editor.tabActionUnpinVisibility": false,
      "workbench.editor.tabCloseButton": "off",
      "workbench.experimental.share.enabled": true,
      "workbench.iconTheme": "material-icon-theme",
      "workbench.preferredDarkColorTheme": "Default Dark Modern",
      "workbench.preferredLightColorTheme": "Default Light Modern",
      "workbench.productIconTheme": "material-product-icons",
      "workbench.startupEditor": "welcomePageInEmptyWorkbench"
    };
    userTasks = { }; # gimana nanti
  };
}