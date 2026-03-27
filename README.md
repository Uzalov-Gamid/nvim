# Neovim: минимальный LazyVim под Python и DevOps

Личная конфигурация на базе [LazyVim](https://github.com/LazyVim/LazyVim): меньше лишнего, упор на **Python**, **shell (Bash)**, **PostgreSQL** и типичный инфраструктурный стек (Docker, Terraform, YAML, JSON).

## Чем эта настройка отличается от стандартного LazyVim

| Аспект | Обычный LazyVim (стартовый шаблон) | Этот репозиторий |
|--------|-------------------------------------|------------------|
| **Объём** | Много примеров (`example.lua`), комментарии из шаблона, опциональный тяжёлый dashboard | Только нужные файлы: `colorscheme`, `mason`, без `example.lua` и без кастомного ASCII-заголовка в dashboard |
| **Языковые модули (extras)** | Вы подключаете сами или копируете длинный список | Задан узкий набор под задачи: Python, SQL, YAML, JSON, Docker, Terraform. **Нет** Helm и Ansible по умолчанию — меньше плагинов и LSP; при необходимости их можно включить через `:LazyExtras` |
| **PostgreSQL / SQL** | Не включено, пока не добавите extra | Включён `lang.sql`: treesitter для SQL, [vim-dadbod](https://github.com/tpope/vim-dadbod) + UI, sqlfluff через Mason — удобно для `.sql`, миграций и работы с БД |
| **Bash / shell** | В LazyVim нет отдельного extra «bash»; подсветка и парсеры идут через treesitter, инструменты — по желанию | Явно через Mason ставятся **shellcheck** и **shfmt** (см. `lua/plugins/mason.lua`) для линтинга и форматирования shell-скриптов |
| **Python** | Через `:LazyExtras` → `lang.python` | Подключён в `lazy.lua` сразу: LSP (Pyright и т.д. по документации extra), форматирование, интеграции LazyVim для Python |
| **Проверка обновлений плагинов** | В шаблоне часто `checker.enabled = true` | `checker.enabled = false` — тише, без фоновых проверок (можно включить обратно в `lua/config/lazy.lua`) |
| **Тема** | Часто TokyoNight по умолчанию | **Gruvbox** с контрастом `hard` (`lua/plugins/colorscheme.lua`) |
| **Комментарии в коде** | Английские пояснения из upstream | Практически убраны; один важный комментарий в `lua/config/options.lua` про строки подключения к БД для dadbod |
| **Секреты БД** | Документация LazyVim рекомендует `.lazy.lua` | `vim.g.dbs` инициализирован пустым; в комментарии указано хранить реальные URL в `~/.config/nvim/.lazy.lua` и не коммитить |

Итого: это не форк LazyVim, а **тонкий слой** поверх него — отключены лишние примеры, сужен список extras, добавлены SQL и инструменты для shell, упрощён визуальный шум.

## Что внутри по задачам

- **Python** — extra `lang.python` (LSP, форматирование, тесты по документации LazyVim).
- **Bash** — парсеры/подсветка как в LazyVim; **shellcheck** + **shfmt** из Mason.
- **PostgreSQL и SQL** — extra `lang.sql`, dadbod/DBUI, при необходимости настройте `vim.g.dbs` или `.lazy.lua`.
- **DevOps-форматы** — YAML (манифесты, CI), JSON, Dockerfile, Terraform/HCL.

## Требования

- [Neovim](https://neovim.io/) **0.10+** (как у актуального LazyVim)
- `git`
- [Nerd Font](https://www.nerdfonts.com/) — для иконок в UI (рекомендуется)

## Установка

Резервная копия текущего конфига:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

Клонирование (подставьте свой URL):

```bash
git clone https://github.com/YOUR_USERNAME/nvim.git ~/.config/nvim
```

Первый запуск `nvim` подтянет плагины через lazy.nvim.

## Структура

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # LazyVim + extras + lazy.nvim
│   │   ├── options.lua   # vim.g.dbs и др.
│   │   ├── keymaps.lua   # пусто — добавляйте свои хоткеи
│   │   └── autocmds.lua
│   └── plugins/
│       ├── colorscheme.lua
│       └── mason.lua     # shellcheck, shfmt
└── README.md
```

## Полезные команды

- `:Lazy` — плагины  
- `:Mason` — бинарники LSP/линтеров/форматтеров  
- `:LazyExtras` — добавить, например, `lang.helm` или `lang.ansible`  
- Для БД (после настройки подключений): `:DBUI` и команды из [документации SQL extra](https://lazyvim.github.io/extras/lang/sql)

## Ссылки

- [Документация LazyVim](https://lazyvim.github.io/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)

Лицензия: ваш конфиг свободен; плагины — по лицензиям своих репозиториев.
