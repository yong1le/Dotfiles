import Launcher from "../Launcher/Launcher.js";
const WINDOW_NAME = "clipboardlauncher";

const getClipboardItems = () => {
  const clipboard = Utils.exec("cliphist list");
  return clipboard.split("\n");
};

const decodeClipboardItem = (item) => {
  Utils.execAsync([
    "bash",
    "-c",
    `echo "${item}" | cliphist decode | wl-copy`,
  ]).catch((e) => {
    console.log(e);
  });
};

const ClipboardItem = (item) => {
  return Widget.Button({
    on_clicked: () => {
      App.closeWindow(WINDOW_NAME);
      decodeClipboardItem(item);
    },
    attribute: {
      match: (text) => item.match(text ?? ""),
      action: () => decodeClipboardItem(item),
    },
    child: Widget.Label({
      label: item,
      xalign: 0,
      vpack: "center",
      truncate: "end",
    }),
  });
};

export default function AppLauncher() {
  return Launcher({
    name: WINDOW_NAME,
    items: () => getClipboardItems().map(ClipboardItem),
    childSetup: () => {},
  });
}
