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
But there are some customizations that are exclusive to each workstation. You could simply add this to your `.zshrc` and put any customizations in there:

```
source ~/.zshrc.local
```

However, this comes with the caveat of not being able to keep this file in sync across multiple workstations, thus losing access to it. 

Locality helps you with that by **resolving file paths to a file that depends on your current workstation**.

## Getting started

Locality is at its core a shell script. A zsh plugin is also provided. 

###  Basic Installation

Clone this repository and add the folder to your `$PATH`.

```sh
git clone git@github.com:hschne/locality.git && export PATH=$PWD/locality:$PATH
```

### Installation as ZSH Plugin

You can also use the plugin manager of your choice to install Locality

#### Zplug

```
zplug "hschne/locality"
```

#### Antigen 

```
antigen bundle hschne/locality
```

#### Oh my Zsh

```
 git clone https://github.com/hschne/locality ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/locality
```

### Usage

Create the locality configuration file in `~/.config/.locality` and specify the current location, for example: 

```sh
echo "LOCALITY=work" > ~/.config/.locality
```

Run locality with a given file path to get a localized version of it:

```sh 
locality $HOME/.zshrc # Returns $HOME/.work.zshrc - hidden files remain hidden
locality $HOME/somefile # $HOME/work.somefile
```


Install using the plugin manager of your choice. 


## Advanced Usage

You can use Locality to load custom configurations for a variety of tools. Basically anything that can run bash scripts can somehow use Locality.

### Zsh

To load a custom .zshrc For example, add this to your `.zshrc`.

```bash
source $(locality $HOME/.zshrc) # Load '$HOME/.<locality>.zshrc'
```

If you installed the Locality zsh plugin you may also use the built-in `locality-load` function, which handles things like invalid files

```
locality-load $HOME/.zshrc # sources $HOME/.locality.zsh
```

### Vim

To use locality within Vim and load a custom configuration file add this to your `.vimrc`: 

```vim
let locality_file = system('locality $HOME/.vimrc') 
exec "source " . locality_file " Sources $HOME/.<locality>.vim
```

## License

[MIT](LICENSE) (c) [@hschne](https://github.com/hschne)
