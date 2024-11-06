# Instructions for usage

1. To compile the project using make, run the following command in the terminal:

   ```bash
   make
   ```

2. If you encounter a "Permission denied" error while trying to create the "build" directory, it may be due to insufficient permissions. In that case, run the following command:

   ```bash
   sudo chown -R $(id -u):$(id -g) .
   ```

   This will give your current user ownership of the project directory and allow you to create files.

3. To clean up generated files (like the "build" directory), use:

   ```bash
   make clean
   ```

4. Alternatively, you can compile the project directly from Visual Studio Code (VSCode):
   - Open the project folder in VSCode.
   - Make sure you have the "C/C++" extension installed.
   - Press "Ctrl+Shift+B" (or "Cmd+Shift+B" on macOS) to open the build options.
   - Select "Build" to compile the project using this Makefile.
