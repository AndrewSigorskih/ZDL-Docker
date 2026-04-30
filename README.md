# ZDL-Docker

Enjoy your favourite DOOM experience without any dependency issues.

This repo contains recipie for creating a Docker image containing GZDoom + ZDL combo  prepaired to run classic Doom games.
GzDoom config is tailored to work with with [Project Brutality](https://projectbrutality.com/) mod.

Now updated to use Pulseaudio socket and .Xauthority credentials.


## How to DOOM

### 0. Get DOOM WADs

You can buy classic Doom games on Steam<sup>[1],[2]</sup>, GOG, or download FreeDoom<sup>[3]</sup> for free.

### [Optional] 0.5 Get Sigil I and II.

SIGIL episodes can be downloaded from Romero's <a href="https://romero.com/sigil">website</a>. Note that those still need DOOM.wad to run.

### 1. Set up mountable directories

Create folder for WADS somewhere on your machine (for example, `"$HOME/games/doom/wads"`) and place WADs you posess in it. Modify `DOOMWADDIR` variable in the sh script to reference this directory.

Create second folder for storing game saves. Modify `DOOMSAVEDIR` variable in the script to correctly reference it as well.

Create the third folder to store your zdl configs that declare WADs loading order (examples can be found in the `zdl-configs` directory of this repo).

### 2. [Optional] Download DHTP

Download **ZDoom**-compatible version of Doom High Texture Pack from project <a href="https://github.com/KuriKai/DHTP/wiki">page</a>. Place it in the WADs directory. 

Update file name to match the correct version in `gzdoom.ini` config under the **[doom.Autoload]** section. If you don't plan to use it, remove this section completely.

### [Optional] 3 Download any other mods

* **Project Brutality** mod can be downloaded from project's official GitHub repo. Navigate to the active development/"PB_Staging" [branch](https://github.com/pa1nki113r/Project_Brutality/tree/PB_Staging) on project's GitHub, click big green "Code" button -> Download zip. Rename the archive to "project_brutality_staging.zip" (or whatever you prefer) and place it in the WADs directory.

* [IDKFA](https://www.moddb.com/mods/brutal-doom/addons/idkfa-doom-soundtrack) soundtrack update for oridinal Doom.

* [Maps of Chaos](https://www.moddb.com/mods/brutal-doom/addons/brutalized-doom-and-doom-ii) map/enemy expansion for Doom I and II.

etc.

### 4. Build image.

Clone this repo, navigate into it's respective folder and build:

```bash
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t zdl-docker .
```

### 5. Run

Run the sh script. If everythong works correctly, you should see the ZDL launcher window. Create new wads configuration or load existing one: click "ZDL" button on the bottom -> load .ini -> navigate into `zdl-configs` directory under your user 'player' and select the .ini configuration of your preference. You can create custom configs and save those to keep for future use. Find more information on how to use ZDL on project [page](https://github.com/lcferrum/qzdl).

When you are done, click "Launch".

Enjoy!


## PB-specific controls set in gzdoom config

These are set in the `gzdoom.ini` config under the section **[Doom.PBAdvMoves.Bindings]**.

* C -- switch weapon mode
* V -- open grenade type select wheel
* G -- throw grenade
* F -- quick melee strike
* Mouse wheel click -- kick
* Shift -- Dash
* X -- crouch
* B -- toggle flashlight
* H -- taunt
* L -- clear gore/debris (do this before saving on entity-heavy maps to **avoid crashes**)

*The internal names for these actions are subject to change as PB is still in development. If anything donesn't work, you may need to modify the action names in the `gzdoom.ini` file under the section. Navigate to the [Project Brutality repo](https://github.com/pa1nki113r/Project_Brutality/tree/PB_Staging), open the `KEYCONF.txt` and search for correct action names.

## Personal notes

* Before starting a new game, navigate to Project Brutality -> General spawn settings, and set the spawn rules to "**Dynamic Progression**" while also adjusting for number of maps for best experience. (I am yet to find a gzdoom.ini config option for that to be set). For example, choose 8 for any Doom I campaign.

* In order to play SIGIL maps, add them as "External files" in the launcher menu when using the DOOM 1 configuration.

* Sadly, popular HUD mods like [UDV](https://www.moddb.com/mods/brutal-doom/addons/doomvisor-hud-for-pa1nki113r-v51) (even with 3.0 fixed [version](https://www.moddb.com/mods/brutal-doom/addons/wip-ish-project-brutality-30-compatible-ultimate-doomvisor)) or [CatVisor](https://www.moddb.com/mods/brutal-doom/addons/catsvisor-hud-12-for-bd21-more-widescreen) dont work properly with PB recent versions so we have to use the PB built-un HUD for best experience.


[1] <a href="https://store.steampowered.com/app/2280/DOOM_1993/">DOOM (1993) on Steam</a> -- will get you DOOM.wad<br>
[2] <a href="https://store.steampowered.com/app/2300/DOOM_II/">DOOM II on Steam</a> -- will get you DOOM2.wad, TNT.wad and PLUTONIA.wad<br>
[3] <a href="https://freedoom.github.io/download.html">FreeDoom project</a>
