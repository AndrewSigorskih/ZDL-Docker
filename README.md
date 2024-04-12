# ZDL-Docker

Enjoy your favourite DOOM experience without any dependency issues.

This repo contains recipie for creating a Docker image containing GZDoom + ZDL combo as well as configuration files prepaired to run classic Doom games with [Project Brutality](https://projectbrutality.com/) mod.


## How to DOOM

### 0. Get DOOM WADs

You can buy classic Doom games on Steam<sup>[1],[2]</sup>, GOG, or download FreeDoom<sup>[3]</sup> for free.

### [Optional] 0.5 Get Sigil I and II.

SIGIL episodes can be downloaded from Romero's <a href="https://romero.com/sigil">website</a>. Note that those still need DOOM.wad to run.

### 1.Set up mountable directories

Create folder for WADS somewhere on your machine (for example, `"$HOME/games/doom/wads"`) and place WADs you posess in it. Modify `DOOMWADDIR` variable in the sh script to point for the WAD dir.

Create second folder for storing game saves. Modify `DOOMSAVEDIR` variable in the script to correctly reference it as well.

Place ZDL configs from this repo (`zdl-*.ini`) in saves folder (or in WADs, doesn't matter actually).

### 2. Download DHTP

Download **Zdoom**-compatible version of Doom High Texture Pack from project <a href="https://github.com/KuriKai/DHTP/wiki">page</a>. Place it in the WADs directory. 

[Optional] update file name to match the correct version in `gzdoom.ini` config under the **[doom.Autoload]** section. If you don't plan to use it, remove this section completely.

### 3. Download Project Brutality mod

Navigate to the active development/"Staging" [branch](https://github.com/pa1nki113r/Project_Brutality/tree/PB_Staging) on project's GitHub, click big green "Code" button -> Download zip. Rename the achive to "project_brutality_staging.zip" (or whatever you prefer) and place it in the WADs directory.

### [Optional] 3.5 Download any other mods

* [IDKFA](https://www.moddb.com/mods/brutal-doom/addons/idkfa-doom-soundtrack) soundtrack update for oridinal Doom

### 4. Build image.

Clone this repo, navigate into it's respective folder and build:

```bash
docker build -t zdl-docker .
```

### 5. Run

Run the sh script. If everythong works correctly, you should see the ZDL launcher window. Click "ZDL" button on the bottom -> load .ini -> navigate into /saves directory and select the .ini configuration of your preference. You can create custom configs and save those in mounted folders to keep for future use. Find more information on how to use ZDL on project [page](https://github.com/lcferrum/qzdl).

When you are done, click "Launch".

Enjoy!


## PB-specific controls set in gzdoom config

* C -- switch weapon mode
* V -- open grenade type select wheel
* G -- throw grenade
* F -- quick melee strike
* Mouse wheel click -- kick
* Shift -- Dash
* X -- crouch
* L -- clear gore/debris (do this before saving to **avoid crashes**)

## Personal notes

* Every time the game is loaded, navigate to Project Brutality -> General spawn settings and set the spawn rules to "**Chaotic random**" for best experience. (I am yet to find a gzdoom.ini config option for that to be ready).

* In order to play SIGIL maps, add them as "External files" in the launcher menu when using the DOOM 1 configuration.

* Sadly, popular HUD mods like [UDV](https://www.moddb.com/mods/brutal-doom/addons/doomvisor-hud-for-pa1nki113r-v51) (even with 3.0 fixed [version](https://www.moddb.com/mods/brutal-doom/addons/wip-ish-project-brutality-30-compatible-ultimate-doomvisor)) or [CatVisor](https://www.moddb.com/mods/brutal-doom/addons/catsvisor-hud-12-for-bd21-more-widescreen) dont work properly with PB recent versions so we have to use the PB built-un HUD for best experience.


[1] <a href="https://store.steampowered.com/app/2280/DOOM_1993/">DOOM (1993) on Steam</a><br>
[2] <a href="https://store.steampowered.com/app/2300/DOOM_II/">DOOM II on Steam</a><br>
[3] <a href="https://freedoom.github.io/download.html">FreeDoom project</a>