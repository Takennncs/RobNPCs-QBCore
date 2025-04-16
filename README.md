# takenncsDev NPC Robbery

## Description
This script allows players to **rob NPCs** in a FiveM server if they are armed and aiming at an NPC. When the player aims at an NPC and presses the "E" key, the robbery process is initiated, during which the NPC is frozen and the player may receive money or other rewards.

## Installation

1. **Install dependencies**:
   - **qb-core** — This dependency is already included if you're using the **QBCore** framework.
   - **ox_lib** — Used for certain functions in the script.

2. **Add the files** to the relevant directories in your server:
   - **client.lua**
   - **server.lua**
   - **fxmanifest.lua**

3. **Ensure that** you have **qb-core** and **ox_lib** installed on your server.

4. **Start your server and test**:
   - After installation, start your server and enter the game.
   - When a player is armed and aiming, they can rob an NPC by pressing the "E" key.

## Features

- **Robbing NPCs**: Players can rob NPCs when they are armed and aiming at them.
- **Cooldown Time**: After each robbery, a cooldown period (9 seconds) is applied to prevent spamming robberies.
- **Progress Bar**: A progress bar is displayed during the robbery process, lasting for 5 seconds.
- **Freezing NPCs**: The NPC is frozen during the robbery to prevent it from moving or reacting.
- **Money Reward**: After a successful robbery, the player receives a random amount of money.
  
## How to Use

1. To **rob NPCs**, the player must be armed and aiming at an NPC.
2. Once the player is aiming at an NPC and presses the "E" key, the robbery process begins.
3. During the robbery, the NPC is frozen, and the player may receive money or other rewards.
4. After the robbery, a cooldown period is applied before the player can rob again.

## License

The project is licensed under the **MIT** license. For more details, refer to the [MIT License](https://opensource.org/licenses/MIT).

## Contact

If you have any questions or issues, feel free to contact me:

- **Discord**: takenncss

## Thank You!

Thank you for using the **takenncsDev NPC Robbery** script! We hope it adds excitement and new opportunities to your FiveM server.
