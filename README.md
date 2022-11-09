# 🤕 headache.nvim

**headache.nvim** allows you to define fileheaders that are added to a certain filetype.

## 📦 requirements

- [nvim](https://neovim.io/) >= 0.5
<p>&nbsp;</p>

## 💾 installation

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
-- Lua
use {
  'abecodes/headache.nvim',
  config = function()
    require('headache').setup {
      go = {
        text = '// header for go files', -- text to appear as header
        template = '', -- path to a file containing the header text
        ensure = true, -- add the header to existing files as well
      },
      html = {
        template = 'path/to/html/header.txt', -- path to a file containing the header text
      },
      js = {
        text = '/**\n* multi\n* line\n* header\n*/', -- text to appear as header
      },
    }
  end,
}
```

<p>&nbsp;</p>


## 🛠️ options

Each **key** in the options object defines the file-extension of the files where the header should be added.

### text

Defines the header, multiline headers with `\n`, eg:  
`// line one\n// line two`

An empty line is added after the header by default.

### template

Path to a header file. The text inside will be used as header.  
If *text* and *template* are present, *template* will overwrite *text*

### ensure

If *ensure* is set to `true` the plugin will add the header to every file of the given type opened in nvim.

<p>&nbsp;</p>

## ✅ todo
- [] add variables to template
- [] add exclude path/folder option
- [] ignore empty lines when ensuring

<p>&nbsp;</p>
