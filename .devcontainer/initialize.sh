#!/bin/bash
set -x

if [ ! -f ~/.initialized ]; then
    git config --local --add --bool push.autoSetupRemote true
    git config --local core.editor 'code --wait'
    git config --local push.default current

    uv generate-shell-completion bash >> ~/.bash_completion

    touch ~/.initialized
fi

uv sync --group dev --all-extras --frozen

uv python install

uv run pre-commit install --install-hooks
