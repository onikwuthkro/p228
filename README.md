# P228 Administration Script

## What is this?
P228 Administration Script(p228) is an idea originally presented by [**Sneak Eater**](http://unrealsoftware.de/files_show.php?file=1884). The idea of the original script was good, however, it was buggy. There is also a [**fixed version**](http://unrealsoftware.de/files_show.php?file=5175) of the script, but it's code was terrible, too. So, I took the idea from both scripts and I wrote my version from scratch, which means I haven't used any part of the scripts.

## Latest Version
The latest version can be downloaded [here](https://github.com/yukiusagi/p228/archive/master.zip).

## Installation
P228 is a one-file script, just save it as a .lua file and put it in your *autorun* folder. Easy. To make yourself administration, open p228.lua and find the line `p228_admin = {xxxxx}`. Change `xxxxx` to your USGN and it's done.  
**Reminder**  
You don't have to change `xxxxx` to your USGN if you are hosting the server locally.

## Documentation
There is a few settings you may set.  
`p228_allweapon = true` - True for administrating with all weapons, otherwise you can only administrate the server with specified weapon.  
`p228_weapon = 4` - `4` is the id of the weapon needed to administrate the server. 4 is p228, you may change it to whatever you like, for example, you may change it to laser(id is 45).  
`p228_admin = {xxxxx}` - `xxxxx` is your USGN. If you have got multiple administrators, use `,` to separate the USGN IDs. For example, `p228_admin = {131785, 22801}` will work, but `p228_admin = {131785 22801}` will not work.  
`p228_giveonspawn = false` - Setting it to true will allow the script give the administrating weapon to administrators on their spawn. I recommend setting it to false, otherwise other(and you) administrator(s) can cheat with this one(if you use powerful weapon as administration weapon). If `p228_allweapon` is set to true, this one will not work.

## Frequently Asked Questions
#### How to Install this?
Well, read the part ***Installation*** above.

#### How many functions does this script have?
It has 12 functions currently, including:  
- kick  
- banip  
- strip  
- freeze and unfreeze  
- rename  
- catch  
- kill  
- maket  
- makect  
- makespec  
- getinfo

#### How to use?
After installing the script, simply start(or restart) the server. You will see two hudtexts on your hud. The left one indicates whether administration is enabled, and the other one indicates which function you are currently using. Press F2 on your keyboard to enable/disable administration, press F3 to change functions. 
![](http://i.imgbox.com/9MbjWgRF.jpg)

#### Why I cannot get players' ranks by *getinfo*?
Ranks are only shown when the players are logged in to USGN, ask them to login to USGN. To force them to login to USGN, simply enable **Registered U.S.G.N users only** in New Game menu.

#### Why I dealt zero damage when I shoot enemies?
Check if you enabled administration. When administration is enabled, you will not deal damage with any shots with the administrating weapon.

## Contribution
If you have got new functions for the script, you are welcomed to commit changes to the script. Send pull requests and I will review them.

## License and Author Informations
This script is released under [Creative Commons 4.0 BY-SA](https://creativecommons.org/licenses/by-sa/4.0/).
You may edit and redistribute it as long as you don't violate the commons.

Script by Yuki Usagi(USGN: 131785)  
Website: [blog.yuki.ga](blog.yuki.ga)  
E-mail: [karst124@gmail.com](mailto:karst124@gmail.com)
