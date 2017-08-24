const { app, BrowserWindow } = require('electron');

app.on('ready', () => {
  const mainWindow = new BrowserWindow({});

  const file = 'file://' + __dirname + '/index.html';

  mainWindow.loadURL(file);

  mainWindow.webContents.on('will-navigate', (e, url) => {
    e.preventDefault();
    console.log(url);
    const realPath = url.slice(7);
    mainWindow.webContents.send('open-file', realPath);
    // console.log(mainWindow.webContents.getAllWebContents());
  });
});
