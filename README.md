# How-to
This guide allows you to open zed in the correct environment and have a working LSP for the C/C++ code of your project. Due to the current limitation of Zed in matter of LSP you will need to run a script once at the start of your project so that clangd will work somewhat properly while still using gcc/g++ as a compiler.

## Windows
1. Install Zed - [link](https://zed.dev/windows)
2. Install nrfutil - [link](https://docs.nordicsemi.com/bundle/nrfutil/page/guides/installing.html)
3. Install nRF Connect SDK via command line - [link](https://docs.nordicsemi.com/bundle/ncs-latest/page/nrf/installation/install_ncs.html)
4. Copy [the script](./windows/setup_zephyr_project_for_zed.sh) to "C:\Users\<user>\AppData\Roaming\Zed\scripts" _(create the folder if it doesn't exist)_
5. Copy [the task](./windows/tasks.json) to "C:\Users\<user>\AppData\Roaming\Zed" or edit your tasks.json file to add the setup task
6a. To launch Zed in the correct environment, launch it with the [shortcut](./windows/launch_zed_ncs) _(you may change the shortcut command to change the ncs version you want to launch)_
6b. You can change the shortcut key by editing the shortcut properties. _(default: Ctrl+ALT+Z)_
7. Open your zephyr project in Zed (the root has to be where the CMakeLists.txt is)
8. Run the setup task (it will generate a .clangd file that will link clangd to the compile_commands.json and also silence some gcc-specific flags.)
9a. To build and run your project, you have to make your own tasks using west build and flash. You probably want to use local tasks for that.
9b When building your project don't change the name of the build folder. It has to be called build for clangd to work properly

## Linux
coming soon
