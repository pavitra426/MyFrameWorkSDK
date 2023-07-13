const { app, BrowserWindow } = require('electron');
const path = require('path');

if (require('electron-squirrel-startup')) {
  app.quit();
}

const createWindow = () => {
  const mainWindow = new BrowserWindow({
    alwaysOnTop: true,
    show: false,
  });

  mainWindow.maximize();
  mainWindow.setMenuBarVisibility(false);

  mainWindow.loadFile(path.join(__dirname, '/Out/main.html'));

  mainWindow.once("ready-to-show", () => {
    mainWindow.show();
  })
};

app.on('ready', () => {
  var exec = require('child_process').exec;
  exec('python main.py', {
    cwd: path.join(__dirname, './Main')
  }, function(error, stdout, stderr) {
    if (error) {
      console.error(error)
      process.exit(1)
    } else {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
  }
});
