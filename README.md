### :rocket: Personal dotfiles

#### :sparkling_heart: vim, tmux, linux, tilix terminal, spacevim()

##### :computer: To configure Ale for Plain Vim https://github.com/dense-analysis/ale 

-  Lint Erb files - `gem install erb_lint`

- Lint css files - `npm install -g csslint`

- Lint yam files - `sudo apt install yamllint`

- Lint gitcommit messages - `sudo apt install gitlint`

- Install docker lint - `npm install -g dockerfile_lint`

- For Go and Friends - `go install golang.org/x/tools/gopls@latest` & `go install github.com/jstemmer/gotags@latest`

- Tmux Plugin Manager - https://github.com/tmux-plugins/tpm

- LazyGit:

  -  Core: `brew install jesseduffield/lazygit/lazygit`

  -  Use **Git-delta** (as git page): `brew install git-delta`

- Eslint for JS and Friends:

  - ```shell
    yarn global add eslint eslint-config-airbnb
    
    yarn global add eslint-plugin-jsx-a11y@^2.0.0 eslint-plugin-react eslint-plugin-import babel-eslint
    ```

  - Create a global config filr `~/.eslintrc`

    ```json
    {
      "extends": "airbnb",
        "rules": {
          "semi": ["error", "never"],
          "comma-dangle": ["error", "never"]
        }
    }
    ```

  - Ensure this in `vimrc`

    ```
    let g:ale_linters = {
    \  'javascript': ['eslint'],
    \  'jsx': ['eslint']
    \}
    ```

    

