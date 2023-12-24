#!/bin/bash
dotfilesDir=$(pwd)

function CriarSymlink {
  destino="${HOME}/${1}"
  data=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    echo "Removendo symlink existente: ${destino}"
    rm ${destino}

  elif [ -f "${destino}" ]; then
    echo "Realizando backup de arquivo existente: ${destino}"
    mv ${destino}{,.${data}}

  elif [ -d "${destino}" ]; then
    echo "Realizando backup de diretorio existente: ${destino}"
    mv ${destino}{,.${data}}
  fi

  echo "Criando um novo symlink: ${destino}"
  ln -s ${dotfilesDir}/${1} ${destino}
}

if [ -d "${dotfilesDir}/.config" ]; then
  cd "${dotfilesDir}/.config"
  for file in *; do
    if [ -e "${HOME}/.config/${file}" ]; then
      echo "O link simbólico ${HOME}/.config/${file} já existe."
    else
      ln -s "${dotfilesDir}/.config/${file}" "${HOME}/.config/"
      echo "Link simbólico criado para ${file} em ${HOME}/.config/"
    fi
  done
else
  echo "A pasta .config não foi encontrada em ${dotfilesDir}."
fi

# Cria a pasta de Applications para appimage, se não existir
if [ ! -d "${HOME}/Applications/" ]; then
  mkdir "${HOME}/Applications/"
fi

CriarSymlink .bashrc
CriarSymlink .bash_aliases
CriarSymlink .gitconfig
CriarSymlink .gitignore
CriarSymlink .gitattributes
CriarSymlink .zshrc
CriarSymlink commit-template.txt
CriarSymlink .vimrc
CriarSymlink .XCompose
