#!/bin/bash
if [ ! -f ~/.initialized ]; then
    git config --local --add --bool push.autoSetupRemote true
    git config --local core.editor 'code --wait'
    git config --local push.default current

    # Remind user to set up publishing credentials
    if [ ! -f ~/.pypirc ]; then
        echo "⚠️  No ~/.pypirc found. Copy .pypirc.template to ~/.pypirc and fill in your registry credentials to enable publishing."
    fi

    touch ~/.initialized
fi
