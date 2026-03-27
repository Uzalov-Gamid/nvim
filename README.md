# Neovim config (LazyVim)

**English:** Personal Neovim setup based on [LazyVim](https://github.com/LazyVim/LazyVim), tuned for **Python** and **DevOps** (YAML, JSON, Docker, Terraform, Helm, Ansible).

**Русский:** Личная конфигурация Neovim на базе LazyVim с упором на Python и инфраструктурные задачи.

## Features

| Area | What you get |
|------|----------------|
| **Python** | LSP (Pyright / BasedPyright — см. документацию extra), форматирование, тесты (neotest), опционально отладка (nvim-dap) |
| **YAML / JSON** | LSP, схемы (в т.ч. Kubernetes/OpenAPI через yaml extra) |
| **Docker** | Dockerfile / Compose: treesitter, LSP, линтинг |
| **Terraform / HCL** | treesitter, terraform-ls, интеграции с инструментами из extra |
| **Helm** | подсветка, `helm_ls` |
| **Ansible** | поддержка плейбуков из LazyVim extra |

Цветовая схема: **Gruvbox** (hard). Стартовый экран: кастомный заголовок в [snacks.nvim](https://github.com/folke/snacks.nvim) dashboard.

## Requirements

- [Neovim](https://neovim.io/) **0.10+** (как у актуального LazyVim; при сомнении см. [installation](https://lazyvim.github.io/installation))
- `git`
- [Nerd Font](https://www.nerdfonts.com/) — для иконок в статуслайне и файловом дереве (рекомендуется)
- Для Mason / LSP: компилятор toolchain по мере необходимости (часто достаточно того, что подтянет LazyVim)

## Install

Резервная копия текущего конфига:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak  # опционально: кэш lazy и плагины
```

Клонирование (замените URL на свой форк):

```bash
git clone https://github.com/YOUR_USERNAME/nvim.git ~/.config/nvim
```

Запустите `nvim` — подтянется **lazy.nvim**, затем плагины. Первый старт может занять минуту.

Дальше:

- `:Lazy` — список плагинов
- `:Mason` — LSP/линтеры/форматтеры
- `:LazyExtras` — включить/выключить языковые модули (список extras задаётся в `lua/config/lazy.lua` **до** `import = "plugins"`)

## Repository layout

```
~/.config/nvim/
├── init.lua                 # точка входа → config.lazy
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # bootstrap lazy.nvim, порядок: lazyvim.plugins → extras → plugins/
│   │   ├── options.lua      # опции (пока по умолчанию LazyVim)
│   │   ├── keymaps.lua      # свои хоткеи
│   │   └── autocmds.lua     # автокоманды
│   └── plugins/
│       ├── colorscheme.lua  # Gruvbox + выбор темы LazyVim
│       └── dashboard.lua    # заголовок snacks dashboard
└── README.md
```

## Customization tips

1. **Отключить лишние extras** — закомментируйте соответствующую строку `{ import = "lazyvim.plugins.extras...." }` в `lua/config/lazy.lua` (только **между** `lazyvim.plugins` и `{ import = "plugins" }`) или снимите модуль в `:LazyExtras`.
2. **Python: Ruff / виртуальное окружение** — см. [LazyVim — Python](https://lazyvim.github.io/extras/lang/python).
3. **Дополнительно по вкусу (не в репозитории):**
   - **Регламенты и политики:** extra `lang.rego` (Open Policy Agent)
   - **Kubernetes манифесты:** часто покрывается YAML extra + kubectl в системе; плагины вроде kubectl-обёрток — по желанию
   - **Отладка:** убедитесь, что включён DAP-трек для Python (см. документацию `lang.python`)
4. **Свои хоткеи** — `lua/config/keymaps.lua` (загружается после старта LazyVim).

## Links

- [LazyVim documentation](https://lazyvim.github.io/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)

## License

Конфигурация — ваша; плагины под лицензиями соответствующих репозиториев.
