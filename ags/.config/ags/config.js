import Bar from "./widgets/Bar/bar.js"
import AppLauncher from "./widgets/Launcher/launcher.js";
// import NotificationPopups from "./widgets/Notification/notification.js";

App.config({
  style: "./style.css",
  windows: [Bar(0), Bar(1), AppLauncher()],
});
