# nfsu2on

Game data for the PlayTab copy of *Need for Speed: Underground 2* (PC, v1.2) in the browser
([th0mk/nfsu2-web](https://github.com/th0mk/nfsu2-web), MIT).

- `manifest.json`: the game folder's files (the same list as nfsu2-web's server `/data-manifest`).
- `data/<path>/<n>.gz`: block `n` (1 MiB) of each file, gzipped. The page reads them from
  `https://raw.githubusercontent.com/AlkanoidX/nfsu2on/main/` (made by `web/tools/pieces.py`).

*Need for Speed* and *Need for Speed: Underground 2* are trademarks of Electronic Arts Inc.
