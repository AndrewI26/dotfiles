# dotfiles

Source of truth for my config files.

## Adding new configs

1. Find where the application stores its configuration files.
2. Move those configuration files into this repo's directory.
3. Create a symbolic link from where the application expects the files to be back to this directory.

**Example:**

```bash
mv ~/.config/kitty/kitty.conf ~/dotfiles/kitty/kitty.conf
ln -s ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

### On symbolic links

A **Symbolc link** (symlink) is just tiny file that holds a path pointing to another file. Anything that opens the symlink will effectivly be redirected to the file the _link_ points to.

```bash
ln -s <target> <link-name>
```

In the above code `target` is the real file that exists, and the `link-name` is the path to the new symbolic link.

Inspecting a symbolic link demystifies the process. The symlink made in the example just stores `/Users/andrewiammancini/dotfiles/kitty/kitty.conf`, the literal text string of the file path. The OS knows its a link based on it's file type.

## VS Code

VS Code behaves a little differently compared to most applications as extenions are not fully configurable from a text file. The extensions.txt must be periodically resynced.

| Script | Purpose |
| :------: | ------ |
| install.sh | create the symlinks and install extensions for a new vscode installation |
| refresh-extensions.sh | refresh extensions.txt from what's installed |
