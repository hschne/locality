<h1 align="center">Locality</h1> <p
align="center">Source files depending on your current workstation</p>

<p align="center">
<a href="https://forthebadge.com"><img src="https://forthebadge.com/images/badges/built-with-love.svg"></a>
<a href="https://forthebadge.com"><img src="https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg"></a>
</p>

<br>

Locality is a simple shell script that allows you to change file paths based on a set of environment variables. 
This is very useful if you work on multiple workstations and want to load a customized configuration on each one.

Say you have the workstations `home` and `work`. You use zsh on both, and so have a `.zshrc` that you keep in sync using your [dotfile manager of choice](https://github.com/webpro/awesome-dotfiles#tools). 
But there are some customizations that are exclusive to each workstation. You could simply add this to your `.zshrc`:

```
source ~/.zshrc.local
```

and put your customizations in there. However, this comes with the caveat of not being able to keep this file in sync across multiple workstations, thus losing access to it. 

Locality helps you with that by **resolving file paths to a file that depends on your current workstation**.

## Getting started

Locality is at its core a shell script. A zsh plugin is also provided. 

### Basic Installation & Usage

Clone this repository and add the folder to your `$PATH`.

```sh
git clone git@github.com:hschne/locality.git && export PATH=$PWD/locality:$PATH
```

Create the locality configuration file in `~/.config/.locality` and specify the current location, for example: 

```sh
echo "LOCALITY=work" > ~/.config/.locality
```

Run locality with a given file path to get a localized version of it:

```sh 
locality $HOME/.zshrc # Returns $HOME/.locality.zshrc - hidden files remain hidden
locality $HOME/somefile # $HOME/locality.somefile
```

You can use this to source files based on the current location. For example, add this to your `.zshrc`.

```bash
# Load '$HOME/.work.zshrc' at work and '$HOME/.home.zshrc' at home
source $(locality $HOME/.zshrc)
```

### Usage with ZSH

Locality comes with a zsh plugin that simplifies the sourcing of files - for example, gracefully handling non existing files. To source files use: 

```bash
locality-load $HOME/.zshrc # sources $HOME/.locality.zsh
```

Install using the plugin manager of your choice. 

### Zplug

```
zplug "hschne/locality"
```

### Antigen 

```
antigen bundle hschne/locality
```

### Oh my Zsh

```
 git clone https://github.com/hschne/locality ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/locality
```

## Advanced Usage

You can use Locality to load custom configurations for a variety of programs. Basically anything that can run bash scripts can somehow use Locality.

### Vim

To use locality within Vim and load a custom configuration file add this to your `.vimrc`: 

```vim
let locality_file = system('locality $HOME/.vimrc') 
exec "source " . locality_file # Sources $HOME/.<locality>.vim
```

## License

[MIT][license] (c) [@hschne](https://github.com/hschne)
